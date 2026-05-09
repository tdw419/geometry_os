; DESCRIPTION: Creates a cyan rectangular region at (373, 152) spanning 117 by 87 pixels.
; PLAN: r0=373(x), r1=152(y), r2=117(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 152
LDI r2, 117
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

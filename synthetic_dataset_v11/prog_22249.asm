; DESCRIPTION: Creates a cyan rectangular region at (21, 152) spanning 68 by 17 pixels.
; PLAN: r0=21(x), r1=152(y), r2=68(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 152
LDI r2, 68
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

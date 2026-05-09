; DESCRIPTION: Creates a cyan rectangular region at (100, 186) spanning 117 by 57 pixels.
; PLAN: r0=100(x), r1=186(y), r2=117(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 186
LDI r2, 117
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

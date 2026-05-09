; DESCRIPTION: Creates a red rectangular region at (176, 161) spanning 110 by 37 pixels.
; PLAN: r0=176(x), r1=161(y), r2=110(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 161
LDI r2, 110
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

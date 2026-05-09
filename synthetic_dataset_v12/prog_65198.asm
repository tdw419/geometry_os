; DESCRIPTION: Creates a green rectangular region at (352, 86) spanning 70 by 46 pixels.
; PLAN: r0=352(x), r1=86(y), r2=70(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 86
LDI r2, 70
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

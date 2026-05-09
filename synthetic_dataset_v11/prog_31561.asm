; DESCRIPTION: Creates a blue rectangular region at (91, 9) spanning 71 by 74 pixels.
; PLAN: r0=91(x), r1=9(y), r2=71(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 9
LDI r2, 71
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (74, 91) spanning 30 by 77 pixels.
; PLAN: r0=74(x), r1=91(y), r2=30(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 91
LDI r2, 30
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

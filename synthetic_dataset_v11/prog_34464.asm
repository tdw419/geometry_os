; DESCRIPTION: Renders a white box of size 65x77 starting at (175, 145).
; PLAN: r0=175(x), r1=145(y), r2=65(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 145
LDI r2, 65
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

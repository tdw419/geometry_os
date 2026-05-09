; DESCRIPTION: Renders a white box of size 48x106 starting at (185, 145).
; PLAN: r0=185(x), r1=145(y), r2=48(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 145
LDI r2, 48
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

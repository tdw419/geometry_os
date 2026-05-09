; DESCRIPTION: Renders a blue box of size 20x45 starting at (226, 171).
; PLAN: r0=226(x), r1=171(y), r2=20(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 171
LDI r2, 20
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

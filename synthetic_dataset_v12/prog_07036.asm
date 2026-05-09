; DESCRIPTION: Renders a purple box of size 105x27 starting at (235, 159).
; PLAN: r0=235(x), r1=159(y), r2=105(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 159
LDI r2, 105
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

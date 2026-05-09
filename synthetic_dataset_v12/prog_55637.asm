; DESCRIPTION: Renders a green box of size 111x69 starting at (235, 112).
; PLAN: r0=235(x), r1=112(y), r2=111(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 112
LDI r2, 111
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

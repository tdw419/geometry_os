; DESCRIPTION: Renders a purple box of size 93x33 starting at (251, 126).
; PLAN: r0=251(x), r1=126(y), r2=93(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 126
LDI r2, 93
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue box of size 30x35 starting at (3, 195).
; PLAN: r0=3(x), r1=195(y), r2=30(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 195
LDI r2, 30
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

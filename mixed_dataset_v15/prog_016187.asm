; DESCRIPTION: Renders a blue box of size 30x69 starting at (143, 27).
; PLAN: r0=143(x), r1=27(y), r2=30(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 27
LDI r2, 30
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

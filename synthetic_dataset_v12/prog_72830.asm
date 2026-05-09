; DESCRIPTION: Renders a blue box of size 26x117 starting at (480, 134).
; PLAN: r0=480(x), r1=134(y), r2=26(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 134
LDI r2, 26
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue box of size 30x80 starting at (215, 85).
; PLAN: r0=215(x), r1=85(y), r2=30(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 85
LDI r2, 30
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

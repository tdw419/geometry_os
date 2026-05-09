; DESCRIPTION: Renders a blue box of size 10x53 starting at (160, 117).
; PLAN: r0=160(x), r1=117(y), r2=10(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 117
LDI r2, 10
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

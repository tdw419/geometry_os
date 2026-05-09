; DESCRIPTION: Renders a blue box of size 79x53 starting at (48, 47).
; PLAN: r0=48(x), r1=47(y), r2=79(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 47
LDI r2, 79
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

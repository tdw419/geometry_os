; DESCRIPTION: Renders a yellow box of size 66x76 starting at (396, 180).
; PLAN: r0=396(x), r1=180(y), r2=66(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 180
LDI r2, 66
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

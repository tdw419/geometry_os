; DESCRIPTION: Renders a yellow box of size 68x71 starting at (157, 185).
; PLAN: r0=157(x), r1=185(y), r2=68(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 185
LDI r2, 68
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black box of size 36x94 starting at (157, 63).
; PLAN: r0=157(x), r1=63(y), r2=36(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 63
LDI r2, 36
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

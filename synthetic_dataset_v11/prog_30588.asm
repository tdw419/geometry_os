; DESCRIPTION: Renders a black box of size 66x93 starting at (180, 63).
; PLAN: r0=180(x), r1=63(y), r2=66(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 63
LDI r2, 66
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

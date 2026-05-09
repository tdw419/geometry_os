; DESCRIPTION: Renders a green box of size 74x48 starting at (11, 66).
; PLAN: r0=11(x), r1=66(y), r2=74(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 66
LDI r2, 74
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

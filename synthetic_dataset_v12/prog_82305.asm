; DESCRIPTION: Renders a green box of size 74x89 starting at (24, 16).
; PLAN: r0=24(x), r1=16(y), r2=74(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 16
LDI r2, 74
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

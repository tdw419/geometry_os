; DESCRIPTION: Renders a green box of size 115x74 starting at (261, 120).
; PLAN: r0=261(x), r1=120(y), r2=115(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 120
LDI r2, 115
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

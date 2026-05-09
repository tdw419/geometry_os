; DESCRIPTION: Renders a green box of size 23x117 starting at (140, 27).
; PLAN: r0=140(x), r1=27(y), r2=23(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 27
LDI r2, 23
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

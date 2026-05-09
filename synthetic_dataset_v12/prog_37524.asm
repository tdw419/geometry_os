; DESCRIPTION: Renders a green box of size 57x117 starting at (66, 11).
; PLAN: r0=66(x), r1=11(y), r2=57(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 11
LDI r2, 57
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green box of size 68x74 starting at (37, 156).
; PLAN: r0=37(x), r1=156(y), r2=68(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 156
LDI r2, 68
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

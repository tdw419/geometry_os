; DESCRIPTION: Renders a green box of size 47x115 starting at (56, 118).
; PLAN: r0=56(x), r1=118(y), r2=47(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 118
LDI r2, 47
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

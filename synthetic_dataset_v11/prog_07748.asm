; DESCRIPTION: Renders a green box of size 118x61 starting at (117, 159).
; PLAN: r0=117(x), r1=159(y), r2=118(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 159
LDI r2, 118
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan box of size 118x62 starting at (66, 97).
; PLAN: r0=66(x), r1=97(y), r2=118(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 97
LDI r2, 118
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

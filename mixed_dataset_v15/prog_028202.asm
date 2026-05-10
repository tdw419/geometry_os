; DESCRIPTION: Places a red 54x71 box at position (106, 130).
; PLAN: r0=106(x), r1=130(y), r2=54(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 130
LDI r2, 54
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

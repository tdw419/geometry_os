; DESCRIPTION: Places a red 38x100 box at position (144, 130).
; PLAN: r0=144(x), r1=130(y), r2=38(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 130
LDI r2, 38
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

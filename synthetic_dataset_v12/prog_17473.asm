; DESCRIPTION: Places a red 60x49 rectangle at position (81, 130).
; PLAN: r0=81(x), r1=130(y), r2=60(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 130
LDI r2, 60
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

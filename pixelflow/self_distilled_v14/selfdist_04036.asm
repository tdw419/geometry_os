; DESCRIPTION: Places a red 14x69 box at position (204, 93).
; PLAN: r0=204(x), r1=93(y), r2=14(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 93
LDI r2, 14
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

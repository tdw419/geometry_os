; DESCRIPTION: Places a red 60x69 box at position (20, 3).
; PLAN: r0=20(x), r1=3(y), r2=60(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 3
LDI r2, 60
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

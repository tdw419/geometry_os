; DESCRIPTION: Places a purple 120x85 rectangle at position (311, 126).
; PLAN: r0=311(x), r1=126(y), r2=120(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 126
LDI r2, 120
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

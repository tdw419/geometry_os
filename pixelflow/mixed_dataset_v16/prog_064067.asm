; DESCRIPTION: Places a red 120x85 rectangle at position (208, 105).
; PLAN: r0=208(x), r1=105(y), r2=120(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 105
LDI r2, 120
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

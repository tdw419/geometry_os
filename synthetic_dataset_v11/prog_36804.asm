; DESCRIPTION: Places a red 109x85 rectangle at position (126, 8).
; PLAN: r0=126(x), r1=8(y), r2=109(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 8
LDI r2, 109
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

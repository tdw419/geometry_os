; DESCRIPTION: Places a red 52x117 rectangle at position (258, 81).
; PLAN: r0=258(x), r1=81(y), r2=52(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 81
LDI r2, 52
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red 114x98 rectangle at position (52, 126).
; PLAN: r0=52(x), r1=126(y), r2=114(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 126
LDI r2, 114
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

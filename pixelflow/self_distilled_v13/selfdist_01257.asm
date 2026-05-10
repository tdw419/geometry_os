; DESCRIPTION: Places a red 120x13 box at position (241, 68).
; PLAN: r0=241(x), r1=68(y), r2=120(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 68
LDI r2, 120
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

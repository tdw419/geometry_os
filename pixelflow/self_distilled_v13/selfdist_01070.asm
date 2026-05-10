; DESCRIPTION: Places a red 52x43 box at position (195, 60).
; PLAN: r0=195(x), r1=60(y), r2=52(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 60
LDI r2, 52
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

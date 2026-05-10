; DESCRIPTION: Places a yellow 52x43 box at position (309, 53).
; PLAN: r0=309(x), r1=53(y), r2=52(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 53
LDI r2, 52
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

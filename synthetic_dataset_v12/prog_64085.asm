; DESCRIPTION: Places a black 98x101 rectangle at position (270, 127).
; PLAN: r0=270(x), r1=127(y), r2=98(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 127
LDI r2, 98
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

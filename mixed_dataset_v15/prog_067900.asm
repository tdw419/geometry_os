; DESCRIPTION: Places a green 25x105 rectangle at position (452, 100).
; PLAN: r0=452(x), r1=100(y), r2=25(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 100
LDI r2, 25
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

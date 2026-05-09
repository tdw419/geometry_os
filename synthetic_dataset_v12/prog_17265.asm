; DESCRIPTION: Places a green 11x69 rectangle at position (309, 132).
; PLAN: r0=309(x), r1=132(y), r2=11(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 132
LDI r2, 11
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

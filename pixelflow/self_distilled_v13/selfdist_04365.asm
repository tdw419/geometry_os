; DESCRIPTION: Places a green 53x98 box at position (267, 140).
; PLAN: r0=267(x), r1=140(y), r2=53(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 140
LDI r2, 53
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

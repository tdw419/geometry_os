; DESCRIPTION: Places a blue 104x57 box at position (309, 30).
; PLAN: r0=309(x), r1=30(y), r2=104(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 30
LDI r2, 104
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

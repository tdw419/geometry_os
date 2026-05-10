; DESCRIPTION: Places a magenta 105x65 box at position (309, 40).
; PLAN: r0=309(x), r1=40(y), r2=105(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 40
LDI r2, 105
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

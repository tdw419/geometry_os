; DESCRIPTION: Places a purple 39x63 box at position (268, 3).
; PLAN: r0=268(x), r1=3(y), r2=39(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 3
LDI r2, 39
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

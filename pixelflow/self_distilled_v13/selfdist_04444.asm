; DESCRIPTION: Places a blue 111x79 box at position (234, 91).
; PLAN: r0=234(x), r1=91(y), r2=111(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 91
LDI r2, 111
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

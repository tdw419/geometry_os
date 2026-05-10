; DESCRIPTION: Places a blue 99x96 box at position (195, 95).
; PLAN: r0=195(x), r1=95(y), r2=99(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 95
LDI r2, 99
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

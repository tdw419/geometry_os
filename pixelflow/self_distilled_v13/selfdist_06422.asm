; DESCRIPTION: Places a green 43x116 box at position (162, 127).
; PLAN: r0=162(x), r1=127(y), r2=43(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 127
LDI r2, 43
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

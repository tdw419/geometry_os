; DESCRIPTION: Places a red 115x84 box at position (288, 4).
; PLAN: r0=288(x), r1=4(y), r2=115(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 4
LDI r2, 115
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

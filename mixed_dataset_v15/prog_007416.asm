; DESCRIPTION: Places a green 84x46 box at position (35, 70).
; PLAN: r0=35(x), r1=70(y), r2=84(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 70
LDI r2, 84
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

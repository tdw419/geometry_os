; DESCRIPTION: Places a blue 73x17 box at position (239, 18).
; PLAN: r0=239(x), r1=18(y), r2=73(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 18
LDI r2, 73
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a cyan 25x54 box at position (130, 58).
; PLAN: r0=130(x), r1=58(y), r2=25(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 58
LDI r2, 25
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

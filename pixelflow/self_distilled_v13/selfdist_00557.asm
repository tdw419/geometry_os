; DESCRIPTION: Places a green 22x16 box at position (259, 40).
; PLAN: r0=259(x), r1=40(y), r2=22(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 40
LDI r2, 22
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white 68x81 box at position (222, 27).
; PLAN: r0=222(x), r1=27(y), r2=68(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 27
LDI r2, 68
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white 27x89 box at position (186, 11).
; PLAN: r0=186(x), r1=11(y), r2=27(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 11
LDI r2, 27
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

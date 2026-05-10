; DESCRIPTION: Places a white 27x92 box at position (360, 85).
; PLAN: r0=360(x), r1=85(y), r2=27(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 85
LDI r2, 27
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

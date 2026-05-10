; DESCRIPTION: Draws a cyan line from (506, 40) to (350, 89).
; PLAN: r0=506(x1), r1=40(y1), r2=350(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 40
LDI r2, 350
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

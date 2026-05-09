; DESCRIPTION: Places a cyan line segment connecting (52, 3) to (206, 51).
; PLAN: r0=52(x1), r1=3(y1), r2=206(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 3
LDI r2, 206
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

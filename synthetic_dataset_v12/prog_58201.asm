; DESCRIPTION: Draws a cyan line from (109, 150) to (53, 110).
; PLAN: r0=109(x1), r1=150(y1), r2=53(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 150
LDI r2, 53
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

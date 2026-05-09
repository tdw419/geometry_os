; DESCRIPTION: Draws a cyan line from (144, 33) to (260, 110).
; PLAN: r0=144(x1), r1=33(y1), r2=260(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 33
LDI r2, 260
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

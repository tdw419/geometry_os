; DESCRIPTION: Draws a cyan line from (189, 18) to (360, 145).
; PLAN: r0=189(x1), r1=18(y1), r2=360(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 18
LDI r2, 360
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

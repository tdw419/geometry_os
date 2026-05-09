; DESCRIPTION: Draws a cyan line from (270, 94) to (208, 136).
; PLAN: r0=270(x1), r1=94(y1), r2=208(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 94
LDI r2, 208
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

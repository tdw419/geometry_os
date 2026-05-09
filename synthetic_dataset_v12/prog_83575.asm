; DESCRIPTION: Draws a cyan line from (463, 225) to (270, 225).
; PLAN: r0=463(x1), r1=225(y1), r2=270(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 225
LDI r2, 270
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

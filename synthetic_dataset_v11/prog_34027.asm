; DESCRIPTION: Draws a cyan line from (132, 214) to (33, 159).
; PLAN: r0=132(x1), r1=214(y1), r2=33(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 214
LDI r2, 33
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (270, 9) to (197, 7).
; PLAN: r0=270(x1), r1=9(y1), r2=197(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 9
LDI r2, 197
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

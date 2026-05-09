; DESCRIPTION: Draws a green line from (117, 197) to (51, 243).
; PLAN: r0=117(x1), r1=197(y1), r2=51(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 197
LDI r2, 51
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

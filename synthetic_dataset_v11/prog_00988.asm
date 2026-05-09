; DESCRIPTION: Draws a yellow line from (196, 98) to (197, 60).
; PLAN: r0=196(x1), r1=98(y1), r2=197(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 98
LDI r2, 197
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

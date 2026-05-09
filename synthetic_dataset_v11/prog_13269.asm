; DESCRIPTION: Draws a green line from (183, 25) to (21, 226).
; PLAN: r0=183(x1), r1=25(y1), r2=21(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 25
LDI r2, 21
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

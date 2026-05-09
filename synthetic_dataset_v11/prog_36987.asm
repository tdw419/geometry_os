; DESCRIPTION: Draws a green line from (50, 226) to (178, 251).
; PLAN: r0=50(x1), r1=226(y1), r2=178(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 226
LDI r2, 178
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

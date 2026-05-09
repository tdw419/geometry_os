; DESCRIPTION: Draws a green line from (178, 254) to (230, 10).
; PLAN: r0=178(x1), r1=254(y1), r2=230(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 254
LDI r2, 230
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (308, 178) to (7, 125).
; PLAN: r0=308(x1), r1=178(y1), r2=7(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 178
LDI r2, 7
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

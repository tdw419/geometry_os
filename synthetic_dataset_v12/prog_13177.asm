; DESCRIPTION: Draws a cyan line from (493, 227) to (174, 207).
; PLAN: r0=493(x1), r1=227(y1), r2=174(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 227
LDI r2, 174
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

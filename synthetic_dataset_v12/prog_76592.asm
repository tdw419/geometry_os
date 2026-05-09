; DESCRIPTION: Draws a green line from (215, 187) to (11, 9).
; PLAN: r0=215(x1), r1=187(y1), r2=11(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 187
LDI r2, 11
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

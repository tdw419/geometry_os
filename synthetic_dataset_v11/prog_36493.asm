; DESCRIPTION: Draws a green line from (41, 196) to (130, 231).
; PLAN: r0=41(x1), r1=196(y1), r2=130(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 196
LDI r2, 130
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

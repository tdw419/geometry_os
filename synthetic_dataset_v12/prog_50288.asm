; DESCRIPTION: Draws a green line from (284, 161) to (130, 24).
; PLAN: r0=284(x1), r1=161(y1), r2=130(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 161
LDI r2, 130
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

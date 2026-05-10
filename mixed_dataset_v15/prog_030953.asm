; DESCRIPTION: Draws a green line from (211, 74) to (284, 18).
; PLAN: r0=211(x1), r1=74(y1), r2=284(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 74
LDI r2, 284
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

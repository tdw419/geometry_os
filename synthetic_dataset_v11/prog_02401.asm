; DESCRIPTION: Renders a green line between points (123, 197) and (94, 5).
; PLAN: r0=123(x1), r1=197(y1), r2=94(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 197
LDI r2, 94
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

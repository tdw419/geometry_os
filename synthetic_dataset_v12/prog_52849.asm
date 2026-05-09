; DESCRIPTION: Draws a blue line from (336, 154) to (197, 120).
; PLAN: r0=336(x1), r1=154(y1), r2=197(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 154
LDI r2, 197
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

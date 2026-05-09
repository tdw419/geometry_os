; DESCRIPTION: Draws a black line from (120, 221) to (144, 221).
; PLAN: r0=120(x1), r1=221(y1), r2=144(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 221
LDI r2, 144
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

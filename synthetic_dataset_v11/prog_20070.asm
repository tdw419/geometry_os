; DESCRIPTION: Draws a green line from (52, 221) to (2, 8).
; PLAN: r0=52(x1), r1=221(y1), r2=2(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 221
LDI r2, 2
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (362, 221) and (219, 158).
; PLAN: r0=362(x1), r1=221(y1), r2=219(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 221
LDI r2, 219
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

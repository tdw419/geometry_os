; DESCRIPTION: Renders a yellow line between points (108, 221) and (197, 193).
; PLAN: r0=108(x1), r1=221(y1), r2=197(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 221
LDI r2, 197
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

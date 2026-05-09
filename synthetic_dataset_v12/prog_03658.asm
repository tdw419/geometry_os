; DESCRIPTION: Renders a green line between points (61, 221) and (66, 55).
; PLAN: r0=61(x1), r1=221(y1), r2=66(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 221
LDI r2, 66
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

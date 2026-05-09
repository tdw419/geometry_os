; DESCRIPTION: Renders a cyan line between points (286, 232) and (292, 208).
; PLAN: r0=286(x1), r1=232(y1), r2=292(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 232
LDI r2, 292
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

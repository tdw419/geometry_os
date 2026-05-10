; DESCRIPTION: Renders a cyan line between points (391, 208) and (170, 83).
; PLAN: r0=391(x1), r1=208(y1), r2=170(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 208
LDI r2, 170
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

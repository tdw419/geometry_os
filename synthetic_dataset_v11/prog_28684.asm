; DESCRIPTION: Renders a cyan line between points (137, 200) and (250, 228).
; PLAN: r0=137(x1), r1=200(y1), r2=250(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 200
LDI r2, 250
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

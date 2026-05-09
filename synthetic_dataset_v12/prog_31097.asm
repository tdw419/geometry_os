; DESCRIPTION: Renders a cyan line between points (424, 98) and (251, 244).
; PLAN: r0=424(x1), r1=98(y1), r2=251(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 98
LDI r2, 251
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

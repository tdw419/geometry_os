; DESCRIPTION: Renders a cyan line between points (50, 54) and (244, 199).
; PLAN: r0=50(x1), r1=54(y1), r2=244(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 54
LDI r2, 244
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

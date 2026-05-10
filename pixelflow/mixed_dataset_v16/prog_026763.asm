; DESCRIPTION: Renders a cyan line between points (200, 55) and (307, 54).
; PLAN: r0=200(x1), r1=55(y1), r2=307(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 55
LDI r2, 307
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

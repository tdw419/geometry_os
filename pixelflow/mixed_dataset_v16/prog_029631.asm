; DESCRIPTION: Renders a cyan line between points (207, 244) and (226, 54).
; PLAN: r0=207(x1), r1=244(y1), r2=226(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 244
LDI r2, 226
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

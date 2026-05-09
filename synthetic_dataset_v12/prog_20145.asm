; DESCRIPTION: Renders a cyan line between points (109, 6) and (372, 236).
; PLAN: r0=109(x1), r1=6(y1), r2=372(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 6
LDI r2, 372
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

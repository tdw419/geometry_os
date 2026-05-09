; DESCRIPTION: Renders a cyan line between points (68, 200) and (48, 206).
; PLAN: r0=68(x1), r1=200(y1), r2=48(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 200
LDI r2, 48
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

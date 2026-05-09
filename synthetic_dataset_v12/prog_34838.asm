; DESCRIPTION: Renders a cyan line between points (13, 160) and (21, 200).
; PLAN: r0=13(x1), r1=160(y1), r2=21(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 160
LDI r2, 21
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

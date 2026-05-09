; DESCRIPTION: Renders a cyan line between points (25, 160) and (206, 7).
; PLAN: r0=25(x1), r1=160(y1), r2=206(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 160
LDI r2, 206
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

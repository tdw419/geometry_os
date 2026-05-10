; DESCRIPTION: Renders a cyan line between points (278, 113) and (229, 15).
; PLAN: r0=278(x1), r1=113(y1), r2=229(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 113
LDI r2, 229
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

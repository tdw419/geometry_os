; DESCRIPTION: Draws a cyan line from (95, 113) to (160, 211).
; PLAN: r0=95(x1), r1=113(y1), r2=160(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 113
LDI r2, 160
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (266, 237) and (287, 113).
; PLAN: r0=266(x1), r1=237(y1), r2=287(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 237
LDI r2, 287
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

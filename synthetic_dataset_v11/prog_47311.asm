; DESCRIPTION: Renders a cyan line between points (27, 113) and (193, 211).
; PLAN: r0=27(x1), r1=113(y1), r2=193(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 113
LDI r2, 193
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

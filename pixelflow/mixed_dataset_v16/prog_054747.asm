; DESCRIPTION: Renders a cyan line between points (283, 61) and (500, 66).
; PLAN: r0=283(x1), r1=61(y1), r2=500(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 61
LDI r2, 500
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

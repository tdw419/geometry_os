; DESCRIPTION: Renders a cyan line between points (283, 70) and (180, 160).
; PLAN: r0=283(x1), r1=70(y1), r2=180(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 70
LDI r2, 180
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

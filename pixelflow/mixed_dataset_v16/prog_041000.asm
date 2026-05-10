; DESCRIPTION: Renders a cyan line between points (70, 125) and (233, 89).
; PLAN: r0=70(x1), r1=125(y1), r2=233(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 125
LDI r2, 233
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

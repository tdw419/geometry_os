; DESCRIPTION: Renders a green line between points (298, 106) and (165, 55).
; PLAN: r0=298(x1), r1=106(y1), r2=165(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 106
LDI r2, 165
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

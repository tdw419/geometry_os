; DESCRIPTION: Renders a cyan line between points (298, 20) and (250, 250).
; PLAN: r0=298(x1), r1=20(y1), r2=250(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 20
LDI r2, 250
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

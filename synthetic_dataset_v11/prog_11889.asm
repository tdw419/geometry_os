; DESCRIPTION: Renders a cyan line between points (251, 69) and (20, 55).
; PLAN: r0=251(x1), r1=69(y1), r2=20(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 69
LDI r2, 20
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

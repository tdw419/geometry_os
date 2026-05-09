; DESCRIPTION: Renders a cyan line between points (176, 250) and (251, 69).
; PLAN: r0=176(x1), r1=250(y1), r2=251(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 250
LDI r2, 251
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

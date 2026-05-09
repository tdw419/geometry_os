; DESCRIPTION: Renders a cyan line between points (430, 69) and (106, 60).
; PLAN: r0=430(x1), r1=69(y1), r2=106(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 69
LDI r2, 106
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

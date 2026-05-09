; DESCRIPTION: Renders a cyan line between points (461, 243) and (185, 202).
; PLAN: r0=461(x1), r1=243(y1), r2=185(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 243
LDI r2, 185
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

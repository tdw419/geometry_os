; DESCRIPTION: Renders a cyan line between points (243, 247) and (250, 18).
; PLAN: r0=243(x1), r1=247(y1), r2=250(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 247
LDI r2, 250
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

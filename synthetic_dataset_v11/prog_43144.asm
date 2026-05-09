; DESCRIPTION: Renders a cyan line between points (175, 125) and (68, 153).
; PLAN: r0=175(x1), r1=125(y1), r2=68(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 125
LDI r2, 68
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

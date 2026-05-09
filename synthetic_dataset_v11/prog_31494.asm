; DESCRIPTION: Renders a cyan line between points (159, 197) and (74, 55).
; PLAN: r0=159(x1), r1=197(y1), r2=74(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 197
LDI r2, 74
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

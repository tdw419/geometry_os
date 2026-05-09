; DESCRIPTION: Renders a cyan line between points (29, 31) and (74, 197).
; PLAN: r0=29(x1), r1=31(y1), r2=74(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 31
LDI r2, 74
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

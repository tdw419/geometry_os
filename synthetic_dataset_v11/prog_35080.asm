; DESCRIPTION: Renders a cyan line between points (138, 113) and (53, 197).
; PLAN: r0=138(x1), r1=113(y1), r2=53(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 113
LDI r2, 53
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

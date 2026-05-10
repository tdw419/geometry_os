; DESCRIPTION: Renders a cyan line between points (456, 114) and (197, 25).
; PLAN: r0=456(x1), r1=114(y1), r2=197(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 114
LDI r2, 197
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

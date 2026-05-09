; DESCRIPTION: Renders a cyan line between points (58, 245) and (121, 25).
; PLAN: r0=58(x1), r1=245(y1), r2=121(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 245
LDI r2, 121
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

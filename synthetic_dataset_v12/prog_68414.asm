; DESCRIPTION: Renders a cyan line between points (189, 178) and (121, 8).
; PLAN: r0=189(x1), r1=178(y1), r2=121(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 178
LDI r2, 121
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

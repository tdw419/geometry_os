; DESCRIPTION: Renders a cyan line between points (145, 114) and (121, 231).
; PLAN: r0=145(x1), r1=114(y1), r2=121(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 114
LDI r2, 121
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

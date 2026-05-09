; DESCRIPTION: Renders a cyan line between points (4, 127) and (58, 206).
; PLAN: r0=4(x1), r1=127(y1), r2=58(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 127
LDI r2, 58
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

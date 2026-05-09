; DESCRIPTION: Draws a cyan line from (236, 114) to (22, 49).
; PLAN: r0=236(x1), r1=114(y1), r2=22(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 114
LDI r2, 22
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

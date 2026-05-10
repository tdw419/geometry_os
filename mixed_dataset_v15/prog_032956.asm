; DESCRIPTION: Draws a cyan line from (45, 114) to (341, 58).
; PLAN: r0=45(x1), r1=114(y1), r2=341(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 114
LDI r2, 341
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

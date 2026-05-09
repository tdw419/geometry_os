; DESCRIPTION: Draws a cyan line from (125, 58) to (139, 69).
; PLAN: r0=125(x1), r1=58(y1), r2=139(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 58
LDI r2, 139
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

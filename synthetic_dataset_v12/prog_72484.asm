; DESCRIPTION: Draws a cyan line from (341, 26) to (326, 74).
; PLAN: r0=341(x1), r1=26(y1), r2=326(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 26
LDI r2, 326
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (108, 104) to (385, 238).
; PLAN: r0=108(x1), r1=104(y1), r2=385(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 104
LDI r2, 385
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

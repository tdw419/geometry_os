; DESCRIPTION: Draws a green line from (239, 212) to (83, 238).
; PLAN: r0=239(x1), r1=212(y1), r2=83(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 212
LDI r2, 83
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

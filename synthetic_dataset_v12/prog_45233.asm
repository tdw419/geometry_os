; DESCRIPTION: Draws a green line from (289, 124) to (255, 35).
; PLAN: r0=289(x1), r1=124(y1), r2=255(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 124
LDI r2, 255
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

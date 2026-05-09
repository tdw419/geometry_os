; DESCRIPTION: Draws a cyan line from (385, 140) to (331, 197).
; PLAN: r0=385(x1), r1=140(y1), r2=331(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 140
LDI r2, 331
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

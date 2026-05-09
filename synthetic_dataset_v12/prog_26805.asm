; DESCRIPTION: Draws a cyan line from (296, 254) to (390, 60).
; PLAN: r0=296(x1), r1=254(y1), r2=390(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 254
LDI r2, 390
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (198, 84) to (339, 157).
; PLAN: r0=198(x1), r1=84(y1), r2=339(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 84
LDI r2, 339
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (197, 198) to (237, 35).
; PLAN: r0=197(x1), r1=198(y1), r2=237(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 198
LDI r2, 237
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

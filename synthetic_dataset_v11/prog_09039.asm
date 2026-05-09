; DESCRIPTION: Draws a cyan line from (3, 164) to (248, 23).
; PLAN: r0=3(x1), r1=164(y1), r2=248(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 164
LDI r2, 248
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

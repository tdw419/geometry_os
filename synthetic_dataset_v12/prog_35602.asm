; DESCRIPTION: Draws a cyan line from (472, 127) to (465, 251).
; PLAN: r0=472(x1), r1=127(y1), r2=465(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 127
LDI r2, 465
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

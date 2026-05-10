; DESCRIPTION: Draws a green line from (77, 220) to (456, 236).
; PLAN: r0=77(x1), r1=220(y1), r2=456(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 220
LDI r2, 456
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (8, 127) to (255, 139).
; PLAN: r0=8(x1), r1=127(y1), r2=255(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 127
LDI r2, 255
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (127, 195) to (198, 97).
; PLAN: r0=127(x1), r1=195(y1), r2=198(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 195
LDI r2, 198
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

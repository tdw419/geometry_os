; DESCRIPTION: Draws a green line from (87, 20) to (226, 195).
; PLAN: r0=87(x1), r1=20(y1), r2=226(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 20
LDI r2, 226
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

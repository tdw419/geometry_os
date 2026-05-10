; DESCRIPTION: Draws a green line from (75, 3) to (60, 195).
; PLAN: r0=75(x1), r1=3(y1), r2=60(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 3
LDI r2, 60
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

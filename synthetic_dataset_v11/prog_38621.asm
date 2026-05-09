; DESCRIPTION: Draws a green line from (127, 35) to (32, 5).
; PLAN: r0=127(x1), r1=35(y1), r2=32(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 35
LDI r2, 32
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (350, 95) to (329, 132).
; PLAN: r0=350(x1), r1=95(y1), r2=329(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 95
LDI r2, 329
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

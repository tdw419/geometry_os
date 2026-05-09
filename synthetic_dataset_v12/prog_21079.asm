; DESCRIPTION: Draws a green line from (480, 144) to (511, 52).
; PLAN: r0=480(x1), r1=144(y1), r2=511(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 144
LDI r2, 511
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

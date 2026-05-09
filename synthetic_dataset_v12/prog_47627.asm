; DESCRIPTION: Draws a green line from (178, 180) to (20, 64).
; PLAN: r0=178(x1), r1=180(y1), r2=20(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 180
LDI r2, 20
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

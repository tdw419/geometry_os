; DESCRIPTION: Draws a green line from (440, 56) to (146, 3).
; PLAN: r0=440(x1), r1=56(y1), r2=146(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 56
LDI r2, 146
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

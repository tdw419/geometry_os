; DESCRIPTION: Draws a yellow line from (94, 173) to (254, 48).
; PLAN: r0=94(x1), r1=173(y1), r2=254(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 173
LDI r2, 254
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

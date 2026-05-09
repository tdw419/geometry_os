; DESCRIPTION: Draws a yellow line from (128, 229) to (446, 94).
; PLAN: r0=128(x1), r1=229(y1), r2=446(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 229
LDI r2, 446
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

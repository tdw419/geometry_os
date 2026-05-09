; DESCRIPTION: Draws a yellow line from (127, 128) to (245, 231).
; PLAN: r0=127(x1), r1=128(y1), r2=245(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 128
LDI r2, 245
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

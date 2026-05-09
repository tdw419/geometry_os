; DESCRIPTION: Draws a yellow line from (206, 7) to (48, 231).
; PLAN: r0=206(x1), r1=7(y1), r2=48(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 7
LDI r2, 48
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

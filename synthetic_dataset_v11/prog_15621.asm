; DESCRIPTION: Draws a green line from (94, 114) to (132, 215).
; PLAN: r0=94(x1), r1=114(y1), r2=132(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 114
LDI r2, 132
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

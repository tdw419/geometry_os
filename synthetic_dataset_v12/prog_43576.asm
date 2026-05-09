; DESCRIPTION: Draws a cyan line from (132, 97) to (328, 168).
; PLAN: r0=132(x1), r1=97(y1), r2=328(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 97
LDI r2, 328
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

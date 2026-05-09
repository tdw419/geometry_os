; DESCRIPTION: Draws a cyan line from (312, 171) to (127, 185).
; PLAN: r0=312(x1), r1=171(y1), r2=127(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 171
LDI r2, 127
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

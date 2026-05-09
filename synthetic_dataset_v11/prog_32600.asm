; DESCRIPTION: Draws a yellow line from (164, 149) to (107, 143).
; PLAN: r0=164(x1), r1=149(y1), r2=107(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 149
LDI r2, 107
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

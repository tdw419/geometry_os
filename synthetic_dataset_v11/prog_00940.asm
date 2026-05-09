; DESCRIPTION: Draws a green line from (186, 28) to (143, 172).
; PLAN: r0=186(x1), r1=28(y1), r2=143(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 28
LDI r2, 143
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

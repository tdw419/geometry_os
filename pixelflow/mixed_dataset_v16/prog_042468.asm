; DESCRIPTION: Draws a green line from (63, 1) to (186, 164).
; PLAN: r0=63(x1), r1=1(y1), r2=186(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 1
LDI r2, 186
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

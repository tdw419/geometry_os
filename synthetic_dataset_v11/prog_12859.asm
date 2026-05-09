; DESCRIPTION: Draws a green line from (213, 37) to (137, 146).
; PLAN: r0=213(x1), r1=37(y1), r2=137(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 37
LDI r2, 137
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

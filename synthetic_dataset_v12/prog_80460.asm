; DESCRIPTION: Draws a green line from (411, 129) to (247, 150).
; PLAN: r0=411(x1), r1=129(y1), r2=247(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 129
LDI r2, 247
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

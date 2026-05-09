; DESCRIPTION: Draws a green line from (120, 4) to (146, 146).
; PLAN: r0=120(x1), r1=4(y1), r2=146(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 4
LDI r2, 146
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

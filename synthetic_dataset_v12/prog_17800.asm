; DESCRIPTION: Draws a black line from (464, 193) to (146, 204).
; PLAN: r0=464(x1), r1=193(y1), r2=146(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 193
LDI r2, 146
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (509, 197) to (63, 31).
; PLAN: r0=509(x1), r1=197(y1), r2=63(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 197
LDI r2, 63
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

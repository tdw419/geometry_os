; DESCRIPTION: Draws a green line from (128, 111) to (186, 63).
; PLAN: r0=128(x1), r1=111(y1), r2=186(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 111
LDI r2, 186
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

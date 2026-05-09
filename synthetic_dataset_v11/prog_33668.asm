; DESCRIPTION: Draws a cyan line from (211, 63) to (9, 244).
; PLAN: r0=211(x1), r1=63(y1), r2=9(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 63
LDI r2, 9
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

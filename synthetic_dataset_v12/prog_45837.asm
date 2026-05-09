; DESCRIPTION: Draws a cyan line from (280, 63) to (159, 159).
; PLAN: r0=280(x1), r1=63(y1), r2=159(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 63
LDI r2, 159
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (63, 222) to (172, 47).
; PLAN: r0=63(x1), r1=222(y1), r2=172(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 222
LDI r2, 172
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (20, 64) to (234, 147).
; PLAN: r0=20(x1), r1=64(y1), r2=234(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 64
LDI r2, 234
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

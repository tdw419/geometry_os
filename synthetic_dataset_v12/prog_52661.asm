; DESCRIPTION: Draws a cyan line from (412, 147) to (349, 128).
; PLAN: r0=412(x1), r1=147(y1), r2=349(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 147
LDI r2, 349
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

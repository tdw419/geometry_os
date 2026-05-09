; DESCRIPTION: Draws a cyan line from (264, 147) to (120, 149).
; PLAN: r0=264(x1), r1=147(y1), r2=120(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 147
LDI r2, 120
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (379, 30) to (58, 163).
; PLAN: r0=379(x1), r1=30(y1), r2=58(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 30
LDI r2, 58
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

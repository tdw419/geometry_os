; DESCRIPTION: Draws a cyan line from (379, 65) to (509, 163).
; PLAN: r0=379(x1), r1=65(y1), r2=509(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 65
LDI r2, 509
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (70, 20) to (376, 36).
; PLAN: r0=70(x1), r1=20(y1), r2=376(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 20
LDI r2, 376
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (56, 36) to (212, 37).
; PLAN: r0=56(x1), r1=36(y1), r2=212(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 36
LDI r2, 212
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

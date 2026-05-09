; DESCRIPTION: Draws a cyan line from (131, 78) to (14, 56).
; PLAN: r0=131(x1), r1=78(y1), r2=14(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 78
LDI r2, 14
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

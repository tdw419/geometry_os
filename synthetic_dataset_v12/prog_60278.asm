; DESCRIPTION: Draws a cyan line from (493, 76) to (278, 247).
; PLAN: r0=493(x1), r1=76(y1), r2=278(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 76
LDI r2, 278
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

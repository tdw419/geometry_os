; DESCRIPTION: Draws a cyan line from (493, 145) to (225, 76).
; PLAN: r0=493(x1), r1=145(y1), r2=225(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 145
LDI r2, 225
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

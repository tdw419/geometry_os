; DESCRIPTION: Draws a cyan line from (425, 241) to (359, 92).
; PLAN: r0=425(x1), r1=241(y1), r2=359(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 241
LDI r2, 359
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

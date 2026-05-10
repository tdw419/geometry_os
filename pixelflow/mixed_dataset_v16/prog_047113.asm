; DESCRIPTION: Draws a cyan line from (83, 165) to (363, 182).
; PLAN: r0=83(x1), r1=165(y1), r2=363(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 165
LDI r2, 363
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

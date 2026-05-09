; DESCRIPTION: Draws a cyan line from (204, 61) to (83, 221).
; PLAN: r0=204(x1), r1=61(y1), r2=83(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 61
LDI r2, 83
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

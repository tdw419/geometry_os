; DESCRIPTION: Draws a cyan line from (413, 23) to (475, 211).
; PLAN: r0=413(x1), r1=23(y1), r2=475(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 23
LDI r2, 475
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

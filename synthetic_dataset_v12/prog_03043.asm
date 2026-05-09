; DESCRIPTION: Draws a cyan line from (477, 250) to (30, 223).
; PLAN: r0=477(x1), r1=250(y1), r2=30(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 250
LDI r2, 30
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

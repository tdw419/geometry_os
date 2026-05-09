; DESCRIPTION: Draws a cyan line from (443, 137) to (436, 233).
; PLAN: r0=443(x1), r1=137(y1), r2=436(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 137
LDI r2, 436
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

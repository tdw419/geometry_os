; DESCRIPTION: Draws a red line from (309, 98) to (104, 120).
; PLAN: r0=309(x1), r1=98(y1), r2=104(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 98
LDI r2, 104
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

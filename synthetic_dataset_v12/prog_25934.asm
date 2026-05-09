; DESCRIPTION: Draws a white line from (303, 111) to (139, 143).
; PLAN: r0=303(x1), r1=111(y1), r2=139(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 111
LDI r2, 139
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

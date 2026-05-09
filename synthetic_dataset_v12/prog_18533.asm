; DESCRIPTION: Draws a white line from (388, 33) to (443, 255).
; PLAN: r0=388(x1), r1=33(y1), r2=443(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 33
LDI r2, 443
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

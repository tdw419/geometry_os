; DESCRIPTION: Draws a black line from (403, 33) to (303, 255).
; PLAN: r0=403(x1), r1=33(y1), r2=303(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 33
LDI r2, 303
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

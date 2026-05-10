; DESCRIPTION: Draws a black line from (57, 247) to (474, 221).
; PLAN: r0=57(x1), r1=247(y1), r2=474(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 247
LDI r2, 474
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (146, 38) to (286, 39).
; PLAN: r0=146(x1), r1=38(y1), r2=286(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 38
LDI r2, 286
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

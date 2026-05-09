; DESCRIPTION: Renders a red line between points (291, 39) and (38, 176).
; PLAN: r0=291(x1), r1=39(y1), r2=38(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 39
LDI r2, 38
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

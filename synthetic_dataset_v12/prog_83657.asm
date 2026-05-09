; DESCRIPTION: Renders a yellow line between points (218, 254) and (510, 61).
; PLAN: r0=218(x1), r1=254(y1), r2=510(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 254
LDI r2, 510
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

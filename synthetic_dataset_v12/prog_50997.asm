; DESCRIPTION: Renders a red line between points (510, 90) and (470, 150).
; PLAN: r0=510(x1), r1=90(y1), r2=470(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 90
LDI r2, 470
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

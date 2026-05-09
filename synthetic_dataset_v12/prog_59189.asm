; DESCRIPTION: Renders a orange line between points (363, 120) and (392, 242).
; PLAN: r0=363(x1), r1=120(y1), r2=392(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 120
LDI r2, 392
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

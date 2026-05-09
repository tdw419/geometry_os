; DESCRIPTION: Renders a orange line between points (231, 242) and (262, 160).
; PLAN: r0=231(x1), r1=242(y1), r2=262(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 242
LDI r2, 262
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

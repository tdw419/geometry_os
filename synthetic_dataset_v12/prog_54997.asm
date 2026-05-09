; DESCRIPTION: Renders a magenta line between points (458, 243) and (193, 231).
; PLAN: r0=458(x1), r1=243(y1), r2=193(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 243
LDI r2, 193
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

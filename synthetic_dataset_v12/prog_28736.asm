; DESCRIPTION: Renders a orange line between points (392, 114) and (213, 139).
; PLAN: r0=392(x1), r1=114(y1), r2=213(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 114
LDI r2, 213
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

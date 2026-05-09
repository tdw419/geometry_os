; DESCRIPTION: Renders a orange line between points (27, 18) and (197, 249).
; PLAN: r0=27(x1), r1=18(y1), r2=197(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 18
LDI r2, 197
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

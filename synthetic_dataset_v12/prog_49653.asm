; DESCRIPTION: Renders a orange line between points (486, 197) and (343, 213).
; PLAN: r0=486(x1), r1=197(y1), r2=343(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 197
LDI r2, 343
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line between points (107, 228) and (74, 48).
; PLAN: r0=107(x1), r1=228(y1), r2=74(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 228
LDI r2, 74
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (281, 125) and (397, 10).
; PLAN: r0=281(x1), r1=125(y1), r2=397(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 125
LDI r2, 397
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

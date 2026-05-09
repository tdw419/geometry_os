; DESCRIPTION: Renders a red line between points (191, 32) and (397, 91).
; PLAN: r0=191(x1), r1=32(y1), r2=397(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 32
LDI r2, 397
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

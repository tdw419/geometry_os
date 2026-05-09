; DESCRIPTION: Composite: . Then Renders a orange line between points (32, 60) and (193, 82). Then Creates a red circular shape at (61, 136) with radius 46.
; PLAN: r0=32(x1), r1=60(y1), r2=193(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=136(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (32, 60) and (193, 82).
; PLAN: r0=32(x1), r1=60(y1), r2=193(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 60
LDI r2, 193
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (61, 136) with radius 46.
; PLAN: r0=61(x), r1=136(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 136
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

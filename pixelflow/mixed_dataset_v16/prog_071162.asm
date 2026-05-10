; DESCRIPTION: Places a red circle of radius 75 at center (359, 117).
; PLAN: r0=359(x), r1=117(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 117
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

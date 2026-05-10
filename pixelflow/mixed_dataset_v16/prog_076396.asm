; DESCRIPTION: Places a red circle of radius 60 at center (80, 174).
; PLAN: r0=80(x), r1=174(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 174
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

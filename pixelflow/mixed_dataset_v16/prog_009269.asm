; DESCRIPTION: Places a red circle of radius 25 at center (392, 212).
; PLAN: r0=392(x), r1=212(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 212
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

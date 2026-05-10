; DESCRIPTION: Places a red circle of radius 66 at center (70, 150).
; PLAN: r0=70(x), r1=150(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 150
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

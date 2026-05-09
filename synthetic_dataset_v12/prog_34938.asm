; DESCRIPTION: Places a red circle of radius 17 at center (290, 152).
; PLAN: r0=290(x), r1=152(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 152
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

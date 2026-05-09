; DESCRIPTION: Places a red circle of radius 33 at center (174, 222).
; PLAN: r0=174(x), r1=222(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 222
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

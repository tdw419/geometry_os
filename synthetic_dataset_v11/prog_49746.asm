; DESCRIPTION: Places a red circle of radius 69 at center (162, 182).
; PLAN: r0=162(x), r1=182(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 182
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

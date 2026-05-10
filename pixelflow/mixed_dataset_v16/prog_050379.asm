; DESCRIPTION: Creates a orange circular shape at (187, 131) with radius 72.
; PLAN: r0=187(x), r1=131(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 131
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

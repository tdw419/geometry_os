; DESCRIPTION: Creates a red circular shape at (187, 223) with radius 13.
; PLAN: r0=187(x), r1=223(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 223
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

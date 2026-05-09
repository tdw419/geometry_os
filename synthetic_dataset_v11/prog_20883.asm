; DESCRIPTION: Creates a orange circular shape at (146, 131) with radius 80.
; PLAN: r0=146(x), r1=131(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 131
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

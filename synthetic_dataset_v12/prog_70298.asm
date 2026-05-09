; DESCRIPTION: Creates a orange circular shape at (368, 173) with radius 61.
; PLAN: r0=368(x), r1=173(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 173
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

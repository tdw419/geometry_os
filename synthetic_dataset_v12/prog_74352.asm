; DESCRIPTION: Creates a red circular shape at (362, 173) with radius 32.
; PLAN: r0=362(x), r1=173(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 173
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

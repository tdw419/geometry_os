; DESCRIPTION: Renders a red disk with center (308, 173) and radius 26.
; PLAN: r0=308(x), r1=173(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 173
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

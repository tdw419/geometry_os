; DESCRIPTION: Renders a yellow box of size 100x31 starting at (408, 173).
; PLAN: r0=408(x), r1=173(y), r2=100(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 173
LDI r2, 100
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

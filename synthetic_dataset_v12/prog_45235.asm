; DESCRIPTION: Places a yellow 61x33 rectangle at position (325, 131).
; PLAN: r0=325(x), r1=131(y), r2=61(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 131
LDI r2, 61
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

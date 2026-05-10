; DESCRIPTION: Places a red disk with center (167, 59) and radius 20.
; PLAN: r0=167(x), r1=59(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 59
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

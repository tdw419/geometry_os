; DESCRIPTION: Places a red disk with center (262, 135) and radius 10.
; PLAN: r0=262(x), r1=135(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 135
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

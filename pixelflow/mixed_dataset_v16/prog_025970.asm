; DESCRIPTION: Renders a red disk with center (346, 59) and radius 33.
; PLAN: r0=346(x), r1=59(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 59
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

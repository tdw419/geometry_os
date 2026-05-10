; DESCRIPTION: Renders a yellow disk with center (392, 153) and radius 67.
; PLAN: r0=392(x), r1=153(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 153
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

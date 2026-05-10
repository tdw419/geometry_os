; DESCRIPTION: Places a yellow disk with center (368, 146) and radius 74.
; PLAN: r0=368(x), r1=146(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 146
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

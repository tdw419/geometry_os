; DESCRIPTION: Places a magenta disk with center (171, 46) and radius 54.
; PLAN: r0=171(x), r1=46(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 46
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

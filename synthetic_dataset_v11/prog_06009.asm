; DESCRIPTION: Creates a yellow circular shape at (54, 146) with radius 29.
; PLAN: r0=54(x), r1=146(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 146
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

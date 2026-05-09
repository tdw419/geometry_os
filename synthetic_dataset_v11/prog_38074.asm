; DESCRIPTION: Creates a green circular shape at (146, 198) with radius 24.
; PLAN: r0=146(x), r1=198(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 198
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

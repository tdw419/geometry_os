; DESCRIPTION: Creates a yellow circular shape at (180, 186) with radius 63.
; PLAN: r0=180(x), r1=186(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 186
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

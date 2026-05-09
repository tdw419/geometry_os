; DESCRIPTION: Creates a yellow circular shape at (146, 126) with radius 67.
; PLAN: r0=146(x), r1=126(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 126
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a yellow circle centered at (146, 78) with radius 57.
; PLAN: r0=146(x), r1=78(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 78
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

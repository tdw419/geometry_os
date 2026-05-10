; DESCRIPTION: Draws a yellow circle centered at (146, 28) with radius 42.
; PLAN: r0=146(x), r1=28(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 28
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

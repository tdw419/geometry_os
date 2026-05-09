; DESCRIPTION: Draws a white circle centered at (218, 57) with radius 56.
; PLAN: r0=218(x), r1=57(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 57
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

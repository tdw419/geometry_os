; DESCRIPTION: Draws a white circle centered at (392, 57) with radius 12.
; PLAN: r0=392(x), r1=57(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 57
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

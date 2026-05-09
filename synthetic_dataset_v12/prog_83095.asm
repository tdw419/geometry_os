; DESCRIPTION: Draws a red circle centered at (295, 145) with radius 29.
; PLAN: r0=295(x), r1=145(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 145
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

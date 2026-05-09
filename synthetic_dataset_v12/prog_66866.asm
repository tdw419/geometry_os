; DESCRIPTION: Draws a red circle centered at (295, 84) with radius 75.
; PLAN: r0=295(x), r1=84(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 84
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

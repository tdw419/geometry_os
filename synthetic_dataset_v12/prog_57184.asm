; DESCRIPTION: Draws a red circle centered at (445, 121) with radius 62.
; PLAN: r0=445(x), r1=121(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 121
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

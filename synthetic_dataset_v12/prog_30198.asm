; DESCRIPTION: Composite: Sets a single white pixel at (262, 161) then Draws a red circle centered at (107, 180) with radius 70.
; PLAN: r0=262(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=180(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 180
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

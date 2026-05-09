; DESCRIPTION: Composite: Draws a red circle centered at (403, 70) with radius 70 then Places a green dot at position (50, 49).
; PLAN: r0=403(x), r1=70(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=49(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 70
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 49
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

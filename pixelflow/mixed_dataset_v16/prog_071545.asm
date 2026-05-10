; DESCRIPTION: Composite: Places a blue dot at position (395, 152) then Draws a cyan circle centered at (206, 125) with radius 66.
; PLAN: r0=395(x), r1=152(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=125(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 152
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 125
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

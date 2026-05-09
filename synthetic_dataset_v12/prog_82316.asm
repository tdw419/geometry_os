; DESCRIPTION: Composite: Places a white dot at position (105, 55) then Places a white circle of radius 47 at center (275, 83).
; PLAN: r0=105(x), r1=55(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=83(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 55
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 83
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

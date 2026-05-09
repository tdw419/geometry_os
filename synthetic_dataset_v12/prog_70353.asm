; DESCRIPTION: Composite: Places a cyan dot at position (410, 240) then Draws a orange circle centered at (372, 142) with radius 22.
; PLAN: r0=410(x), r1=240(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=142(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 410
LDI r1, 240
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 142
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

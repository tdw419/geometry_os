; DESCRIPTION: Composite: Places a cyan dot at position (235, 178) then Draws a orange circle centered at (234, 122) with radius 79.
; PLAN: r0=235(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=122(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 122
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

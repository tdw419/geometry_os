; DESCRIPTION: Composite: Places a cyan dot at position (21, 237) then Creates a blue rectangular region at (125, 110) spanning 63 by 82 pixels.
; PLAN: r0=21(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=110(y), r7=63(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 237
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 110
LDI r7, 63
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

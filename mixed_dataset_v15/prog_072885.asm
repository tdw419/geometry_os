; DESCRIPTION: Composite: Sets a single black pixel at (422, 45) then Renders a white box of size 110x44 starting at (280, 37).
; PLAN: r0=422(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=37(y), r7=110(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 280
LDI r6, 37
LDI r7, 110
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

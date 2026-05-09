; DESCRIPTION: Composite: Places a white 55x47 rectangle at position (290, 90) then Sets a single green pixel at (421, 26).
; PLAN: r0=290(x), r1=90(y), r2=55(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=26(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 90
LDI r2, 55
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 26
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

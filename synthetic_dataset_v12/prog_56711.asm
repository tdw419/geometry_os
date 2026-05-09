; DESCRIPTION: Composite: Creates a white rectangular region at (275, 129) spanning 51 by 20 pixels then Places a cyan dot at position (126, 69).
; PLAN: r0=275(x), r1=129(y), r2=51(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=69(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 129
LDI r2, 51
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 69
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

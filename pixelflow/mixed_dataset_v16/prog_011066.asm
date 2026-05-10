; DESCRIPTION: Composite: Places a yellow dot at position (129, 100) then Places a white 77x120 rectangle at position (268, 130).
; PLAN: r0=129(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=130(y), r7=77(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 268
LDI r6, 130
LDI r7, 77
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

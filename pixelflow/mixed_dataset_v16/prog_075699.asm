; DESCRIPTION: Composite: Creates a white rectangular region at (137, 54) spanning 12 by 11 pixels then Places a yellow dot at position (502, 107).
; PLAN: r0=137(x), r1=54(y), r2=12(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x), r6=107(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 54
LDI r2, 12
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 107
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

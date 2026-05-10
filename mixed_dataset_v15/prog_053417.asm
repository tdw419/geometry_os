; DESCRIPTION: Composite: Places a white dot at position (217, 62) then Renders a white box of size 112x70 starting at (125, 2).
; PLAN: r0=217(x), r1=62(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=2(y), r7=112(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 62
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 2
LDI r7, 112
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

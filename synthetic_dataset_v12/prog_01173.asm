; DESCRIPTION: Composite: Places a white dot at position (369, 95) then Creates a white rectangular region at (263, 202) spanning 43 by 52 pixels.
; PLAN: r0=369(x), r1=95(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=202(y), r7=43(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 95
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 263
LDI r6, 202
LDI r7, 43
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT

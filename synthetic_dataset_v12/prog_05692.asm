; DESCRIPTION: Composite: Sets a single white pixel at (81, 205) then Creates a orange rectangular region at (422, 208) spanning 82 by 36 pixels.
; PLAN: r0=81(x), r1=205(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=208(y), r7=82(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 205
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 208
LDI r7, 82
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

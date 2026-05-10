; DESCRIPTION: Composite: Sets a single green pixel at (298, 38) then Creates a red rectangular region at (156, 82) spanning 82 by 43 pixels.
; PLAN: r0=298(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=82(y), r7=82(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 156
LDI r6, 82
LDI r7, 82
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

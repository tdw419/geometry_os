; DESCRIPTION: Composite: Places a magenta dot at position (165, 211) then Places a magenta 93x38 rectangle at position (240, 109).
; PLAN: r0=165(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=109(y), r7=93(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 109
LDI r7, 93
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Places a orange dot at position (336, 232) then Places a magenta 36x24 rectangle at position (367, 153).
; PLAN: r0=336(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=153(y), r7=36(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 367
LDI r6, 153
LDI r7, 36
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT

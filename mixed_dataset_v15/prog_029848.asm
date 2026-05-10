; DESCRIPTION: Composite: Places a blue dot at position (336, 111) then Places a blue 44x56 rectangle at position (12, 17).
; PLAN: r0=336(x), r1=111(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=12(x), r6=17(y), r7=44(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 111
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 12
LDI r6, 17
LDI r7, 44
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

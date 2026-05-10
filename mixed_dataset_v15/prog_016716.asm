; DESCRIPTION: Composite: Places a magenta dot at position (434, 36) then Places a magenta 119x14 rectangle at position (197, 58).
; PLAN: r0=434(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=58(y), r7=119(width), r8=14(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 36
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 197
LDI r6, 58
LDI r7, 119
LDI r8, 14
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT

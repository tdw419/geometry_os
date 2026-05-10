; DESCRIPTION: Composite: Places a purple dot at position (443, 51) then Renders a blue box of size 116x100 starting at (176, 36).
; PLAN: r0=443(x), r1=51(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=36(y), r7=116(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 51
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 36
LDI r7, 116
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

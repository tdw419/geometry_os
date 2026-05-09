; DESCRIPTION: Composite: Renders a magenta box of size 90x114 starting at (336, 114) then Places a red dot at position (165, 154).
; PLAN: r0=336(x), r1=114(y), r2=90(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=154(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 114
LDI r2, 90
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 154
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

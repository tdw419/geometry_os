; DESCRIPTION: Composite: Places a purple dot at position (70, 235) then Renders a magenta box of size 63x71 starting at (86, 83).
; PLAN: r0=70(x), r1=235(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=83(y), r7=63(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 235
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 83
LDI r7, 63
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT

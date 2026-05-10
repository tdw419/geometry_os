; DESCRIPTION: Composite: Renders a magenta box of size 113x116 starting at (249, 102) then Sets a single black pixel at (405, 94).
; PLAN: r0=249(x), r1=102(y), r2=113(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=94(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 102
LDI r2, 113
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 94
LDI r7, 0x000000
PSET r5, r6, r7
HALT

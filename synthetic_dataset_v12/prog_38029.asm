; DESCRIPTION: Composite: Sets a single magenta pixel at (165, 128) then Renders a purple box of size 31x33 starting at (315, 28).
; PLAN: r0=165(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=28(y), r7=31(width), r8=33(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 315
LDI r6, 28
LDI r7, 31
LDI r8, 33
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT

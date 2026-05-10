; DESCRIPTION: Composite: Sets a single purple pixel at (365, 150) then Renders a magenta disk with center (392, 206) and radius 49.
; PLAN: r0=365(x), r1=150(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=206(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 150
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 206
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a purple dot at position (453, 82) then Places a black 73x59 rectangle at position (256, 181).
; PLAN: r0=453(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=181(y), r7=73(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 181
LDI r7, 73
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

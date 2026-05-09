; DESCRIPTION: Composite: Places a purple dot at position (283, 92) then Renders a blue box of size 59x90 starting at (133, 145).
; PLAN: r0=283(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=145(y), r7=59(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 145
LDI r7, 59
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

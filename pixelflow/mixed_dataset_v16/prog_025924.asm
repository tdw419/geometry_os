; DESCRIPTION: Composite: Places a blue 33x82 rectangle at position (77, 46) then Sets a single purple pixel at (96, 38).
; PLAN: r0=77(x), r1=46(y), r2=33(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=38(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 46
LDI r2, 33
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 38
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT

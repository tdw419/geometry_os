; DESCRIPTION: Composite: Places a blue 84x37 rectangle at position (341, 152) then Sets a single green pixel at (472, 152).
; PLAN: r0=341(x), r1=152(y), r2=84(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x), r6=152(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 152
LDI r2, 84
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 152
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

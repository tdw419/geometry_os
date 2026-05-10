; DESCRIPTION: Composite: Places a blue 69x17 rectangle at position (161, 13) then Sets a single green pixel at (21, 235).
; PLAN: r0=161(x), r1=13(y), r2=69(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=235(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 13
LDI r2, 69
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 235
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

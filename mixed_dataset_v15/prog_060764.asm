; DESCRIPTION: Composite: Places a blue 96x37 rectangle at position (91, 198) then Sets a single green pixel at (271, 9).
; PLAN: r0=91(x), r1=198(y), r2=96(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=9(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 198
LDI r2, 96
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 9
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

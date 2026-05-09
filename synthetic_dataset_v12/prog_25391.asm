; DESCRIPTION: Composite: Places a white 70x86 rectangle at position (340, 136) then Sets a single red pixel at (378, 152).
; PLAN: r0=340(x), r1=136(y), r2=70(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=152(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 136
LDI r2, 70
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 152
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

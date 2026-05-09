; DESCRIPTION: Composite: Places a orange 80x90 rectangle at position (370, 92) then Places a green dot at position (418, 98).
; PLAN: r0=370(x), r1=92(y), r2=80(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=98(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 92
LDI r2, 80
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 98
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

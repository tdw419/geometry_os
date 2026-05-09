; DESCRIPTION: Composite: Places a orange 102x92 rectangle at position (409, 5) then Sets a single green pixel at (492, 247).
; PLAN: r0=409(x), r1=5(y), r2=102(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=247(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 5
LDI r2, 102
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 247
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

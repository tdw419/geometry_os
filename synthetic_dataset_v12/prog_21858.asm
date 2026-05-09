; DESCRIPTION: Composite: Renders a white box of size 108x14 starting at (395, 163) then Sets a single cyan pixel at (13, 125).
; PLAN: r0=395(x), r1=163(y), r2=108(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=125(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 395
LDI r1, 163
LDI r2, 108
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 125
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Renders a cyan box of size 59x29 starting at (255, 140) then Sets a single yellow pixel at (358, 207).
; PLAN: r0=255(x), r1=140(y), r2=59(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=207(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 140
LDI r2, 59
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 207
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Draws a red rectangle at (236, 63) with width 24 and height 108 then Sets a single green pixel at (307, 240).
; PLAN: r0=236(x), r1=63(y), r2=24(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=240(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 63
LDI r2, 24
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 240
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Draws a cyan rectangle at (213, 87) with width 63 and height 38 then Places a cyan dot at position (16, 84).
; PLAN: r0=213(x), r1=87(y), r2=63(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=84(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 213
LDI r1, 87
LDI r2, 63
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 84
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

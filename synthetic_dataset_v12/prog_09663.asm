; DESCRIPTION: Composite: Draws a orange rectangle at (29, 124) with width 93 and height 97 then Places a green dot at position (415, 29).
; PLAN: r0=29(x), r1=124(y), r2=93(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=29(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 29
LDI r1, 124
LDI r2, 93
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 29
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

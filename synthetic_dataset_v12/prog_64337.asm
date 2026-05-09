; DESCRIPTION: Composite: Places a cyan dot at position (509, 185) then Places a green 51x57 rectangle at position (354, 183) then Draws a cyan circle centered at (193, 133) with radius 62.
; PLAN: r0=509(x), r1=185(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=354(x), r6=183(y), r7=51(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=133(y), r12=62(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 509
LDI r1, 185
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 183
LDI r7, 51
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 133
LDI r12, 62
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT

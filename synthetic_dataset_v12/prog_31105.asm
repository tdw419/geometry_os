; DESCRIPTION: Composite: Draws a white circle centered at (413, 82) with radius 31 then Places a yellow 103x86 rectangle at position (270, 127) then Places a purple dot at position (356, 112).
; PLAN: r0=413(x), r1=82(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=127(y), r7=103(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=112(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 413
LDI r1, 82
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 127
LDI r7, 103
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 112
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT

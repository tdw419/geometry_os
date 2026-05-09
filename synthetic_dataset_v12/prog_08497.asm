; DESCRIPTION: Composite: Draws a cyan rectangle at (225, 181) with width 10 and height 42 then Places a red dot at position (487, 192).
; PLAN: r0=225(x), r1=181(y), r2=10(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 181
LDI r2, 10
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

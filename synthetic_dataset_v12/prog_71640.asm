; DESCRIPTION: Composite: Places a yellow dot at position (128, 46) then Draws a cyan rectangle at (80, 138) with width 101 and height 115.
; PLAN: r0=128(x), r1=46(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=138(y), r7=101(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 46
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 138
LDI r7, 101
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

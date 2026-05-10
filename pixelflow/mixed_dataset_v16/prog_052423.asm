; DESCRIPTION: Composite: Places a green dot at position (161, 39) then Creates a blue rectangular region at (189, 123) spanning 17 by 39 pixels.
; PLAN: r0=161(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=123(y), r7=17(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 189
LDI r6, 123
LDI r7, 17
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

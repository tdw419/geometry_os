; DESCRIPTION: Composite: Places a black dot at position (291, 134) then Renders a green box of size 33x58 starting at (280, 165).
; PLAN: r0=291(x), r1=134(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=165(y), r7=33(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 134
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 280
LDI r6, 165
LDI r7, 33
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

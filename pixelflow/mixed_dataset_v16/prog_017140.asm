; DESCRIPTION: Composite: Renders a green box of size 78x91 starting at (28, 49) then Places a green dot at position (23, 214).
; PLAN: r0=28(x), r1=49(y), r2=78(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=214(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 49
LDI r2, 78
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 214
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

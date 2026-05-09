; DESCRIPTION: Composite: Renders a green box of size 89x63 starting at (234, 134) then Places a black dot at position (501, 10).
; PLAN: r0=234(x), r1=134(y), r2=89(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x), r6=10(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 134
LDI r2, 89
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 10
LDI r7, 0x000000
PSET r5, r6, r7
HALT

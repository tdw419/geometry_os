; DESCRIPTION: Composite: Renders a green box of size 29x41 starting at (53, 132) then Sets a single green pixel at (149, 60).
; PLAN: r0=53(x), r1=132(y), r2=29(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=60(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 132
LDI r2, 29
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 60
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

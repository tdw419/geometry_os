; DESCRIPTION: Composite: Places a orange dot at position (377, 113) then Renders a blue disk with center (339, 42) and radius 41.
; PLAN: r0=377(x), r1=113(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=42(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 113
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 339
LDI r6, 42
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

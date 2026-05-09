; DESCRIPTION: Composite: Renders a cyan box of size 119x16 starting at (199, 71) then Renders a red disk with center (99, 111) and radius 41.
; PLAN: r0=199(x), r1=71(y), r2=119(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=111(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 71
LDI r2, 119
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 111
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

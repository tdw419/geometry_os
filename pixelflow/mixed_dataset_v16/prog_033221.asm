; DESCRIPTION: Composite: Places a yellow dot at position (426, 225) then Renders a black box of size 33x35 starting at (33, 5).
; PLAN: r0=426(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=5(y), r7=33(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 225
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 33
LDI r6, 5
LDI r7, 33
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT

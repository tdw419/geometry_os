; DESCRIPTION: Composite: Renders a white box of size 114x111 starting at (203, 41) then Renders a cyan line between points (84, 92) and (478, 193).
; PLAN: r0=203(x), r1=41(y), r2=114(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x1), r6=92(y1), r7=478(x2), r8=193(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 41
LDI r2, 114
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 92
LDI r7, 478
LDI r8, 193
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

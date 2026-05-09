; DESCRIPTION: Composite: Renders a white box of size 113x107 starting at (46, 131) then Renders a purple disk with center (144, 50) and radius 17.
; PLAN: r0=46(x), r1=131(y), r2=113(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=50(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 46
LDI r1, 131
LDI r2, 113
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 50
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

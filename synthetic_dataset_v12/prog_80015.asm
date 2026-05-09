; DESCRIPTION: Composite: Creates a purple circular shape at (322, 187) with radius 38 then Renders a blue box of size 111x60 starting at (383, 51).
; PLAN: r0=322(x), r1=187(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=51(y), r7=111(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 187
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 51
LDI r7, 111
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

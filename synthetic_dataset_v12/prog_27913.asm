; DESCRIPTION: Composite: Places a blue circle of radius 38 at center (382, 89) then Places a blue 87x22 rectangle at position (121, 107).
; PLAN: r0=382(x), r1=89(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=107(y), r7=87(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 89
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 107
LDI r7, 87
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT

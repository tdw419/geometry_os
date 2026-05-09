; DESCRIPTION: Composite: Places a red 94x98 rectangle at position (169, 60) then Places a blue circle of radius 33 at center (354, 34).
; PLAN: r0=169(x), r1=60(y), r2=94(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=34(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 60
LDI r2, 94
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 34
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

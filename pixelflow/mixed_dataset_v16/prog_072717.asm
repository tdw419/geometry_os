; DESCRIPTION: Composite: Renders a blue box of size 59x89 starting at (398, 56) then Places a red circle of radius 70 at center (223, 143).
; PLAN: r0=398(x), r1=56(y), r2=59(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=143(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 56
LDI r2, 59
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 143
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

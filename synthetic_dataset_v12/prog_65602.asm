; DESCRIPTION: Composite: Places a magenta 18x47 rectangle at position (422, 76) then Renders a red disk with center (446, 162) and radius 26.
; PLAN: r0=422(x), r1=76(y), r2=18(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=162(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 76
LDI r2, 18
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 162
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

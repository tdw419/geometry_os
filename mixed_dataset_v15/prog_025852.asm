; DESCRIPTION: Composite: Places a black circle of radius 36 at center (295, 207) then Creates a purple rectangular region at (216, 221) spanning 80 by 28 pixels.
; PLAN: r0=295(x), r1=207(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=221(y), r7=80(width), r8=28(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 207
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 221
LDI r7, 80
LDI r8, 28
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT

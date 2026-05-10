; DESCRIPTION: Composite: Places a cyan circle of radius 78 at center (162, 176) then Places a cyan 28x118 rectangle at position (305, 119).
; PLAN: r0=162(x), r1=176(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=119(y), r7=28(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 176
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 119
LDI r7, 28
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

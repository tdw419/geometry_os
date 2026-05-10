; DESCRIPTION: Composite: Places a cyan circle of radius 23 at center (210, 216) then Places a green 10x23 rectangle at position (223, 53).
; PLAN: r0=210(x), r1=216(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=53(y), r7=10(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 216
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 53
LDI r7, 10
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

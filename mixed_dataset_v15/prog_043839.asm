; DESCRIPTION: Composite: Places a purple circle of radius 76 at center (366, 115) then Places a green 22x113 rectangle at position (27, 87).
; PLAN: r0=366(x), r1=115(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=87(y), r7=22(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 115
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 87
LDI r7, 22
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

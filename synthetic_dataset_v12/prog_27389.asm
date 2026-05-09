; DESCRIPTION: Composite: Places a purple circle of radius 28 at center (32, 108) then Renders a green box of size 31x67 starting at (98, 48).
; PLAN: r0=32(x), r1=108(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=48(y), r7=31(width), r8=67(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 108
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 48
LDI r7, 31
LDI r8, 67
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT

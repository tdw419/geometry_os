; DESCRIPTION: Composite: Places a yellow circle of radius 10 at center (409, 24) then Places a orange 99x13 rectangle at position (160, 76).
; PLAN: r0=409(x), r1=24(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=76(y), r7=99(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 24
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 76
LDI r7, 99
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (153, 16) with radius 15. Then Places a cyan 99x105 rectangle at position (23, 22).
; PLAN: r0=153(x), r1=16(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=22(y), r2=99(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (153, 16) with radius 15.
; PLAN: r0=153(x), r1=16(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 16
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 99x105 rectangle at position (23, 22).
; PLAN: r0=23(x), r1=22(y), r2=99(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 22
LDI r2, 99
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

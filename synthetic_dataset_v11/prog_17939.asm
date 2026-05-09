; DESCRIPTION: Composite: . Then Places a white circle of radius 17 at center (189, 151). Then Places a green 65x37 rectangle at position (108, 138).
; PLAN: r0=189(x), r1=151(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=108(x), r1=138(y), r2=65(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 17 at center (189, 151).
; PLAN: r0=189(x), r1=151(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 151
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 65x37 rectangle at position (108, 138).
; PLAN: r0=108(x), r1=138(y), r2=65(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 138
LDI r2, 65
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

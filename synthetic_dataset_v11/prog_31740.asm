; DESCRIPTION: Composite: . Then Renders a magenta disk with center (124, 32) and radius 10. Then Places a green 108x20 rectangle at position (17, 125).
; PLAN: r0=124(x), r1=32(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=17(x), r1=125(y), r2=108(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (124, 32) and radius 10.
; PLAN: r0=124(x), r1=32(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 32
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 108x20 rectangle at position (17, 125).
; PLAN: r0=17(x), r1=125(y), r2=108(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 125
LDI r2, 108
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

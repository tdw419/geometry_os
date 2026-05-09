; DESCRIPTION: Composite: . Then Places a red circle of radius 32 at center (214, 114). Then Places a green 11x112 rectangle at position (192, 74).
; PLAN: r0=214(x), r1=114(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=192(x), r1=74(y), r2=11(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 32 at center (214, 114).
; PLAN: r0=214(x), r1=114(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 114
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 11x112 rectangle at position (192, 74).
; PLAN: r0=192(x), r1=74(y), r2=11(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 74
LDI r2, 11
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

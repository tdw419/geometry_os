; DESCRIPTION: Composite: . Then Places a black 43x30 rectangle at position (190, 109). Then Renders a yellow disk with center (49, 177) and radius 27.
; PLAN: r0=190(x), r1=109(y), r2=43(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=49(x), r1=177(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 43x30 rectangle at position (190, 109).
; PLAN: r0=190(x), r1=109(y), r2=43(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 109
LDI r2, 43
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (49, 177) and radius 27.
; PLAN: r0=49(x), r1=177(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 177
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

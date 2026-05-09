; DESCRIPTION: Composite: . Then Places a green 117x78 rectangle at position (88, 116). Then Renders a red disk with center (190, 176) and radius 32.
; PLAN: r0=88(x), r1=116(y), r2=117(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=190(x), r1=176(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 117x78 rectangle at position (88, 116).
; PLAN: r0=88(x), r1=116(y), r2=117(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 116
LDI r2, 117
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (190, 176) and radius 32.
; PLAN: r0=190(x), r1=176(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 176
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

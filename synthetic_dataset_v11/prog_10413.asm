; DESCRIPTION: Composite: . Then Renders a blue disk with center (158, 73) and radius 32. Then Places a green 82x34 rectangle at position (69, 137).
; PLAN: r0=158(x), r1=73(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=69(x), r1=137(y), r2=82(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (158, 73) and radius 32.
; PLAN: r0=158(x), r1=73(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 73
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 82x34 rectangle at position (69, 137).
; PLAN: r0=69(x), r1=137(y), r2=82(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 137
LDI r2, 82
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

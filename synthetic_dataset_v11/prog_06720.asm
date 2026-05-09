; DESCRIPTION: Composite: . Then Renders a orange disk with center (139, 54) and radius 30. Then Places a red 87x21 rectangle at position (158, 197).
; PLAN: r0=139(x), r1=54(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=158(x), r1=197(y), r2=87(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (139, 54) and radius 30.
; PLAN: r0=139(x), r1=54(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 54
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 87x21 rectangle at position (158, 197).
; PLAN: r0=158(x), r1=197(y), r2=87(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 197
LDI r2, 87
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

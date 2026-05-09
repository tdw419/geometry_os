; DESCRIPTION: Composite: . Then Places a green 113x12 rectangle at position (139, 144). Then Renders a magenta disk with center (177, 220) and radius 30.
; PLAN: r0=139(x), r1=144(y), r2=113(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x), r1=220(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 113x12 rectangle at position (139, 144).
; PLAN: r0=139(x), r1=144(y), r2=113(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 144
LDI r2, 113
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (177, 220) and radius 30.
; PLAN: r0=177(x), r1=220(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 220
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

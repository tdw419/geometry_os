; DESCRIPTION: Composite: . Then Places a magenta 10x48 rectangle at position (87, 127). Then Creates a white circular shape at (136, 107) with radius 44.
; PLAN: r0=87(x), r1=127(y), r2=10(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=136(x), r1=107(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 10x48 rectangle at position (87, 127).
; PLAN: r0=87(x), r1=127(y), r2=10(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 127
LDI r2, 10
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (136, 107) with radius 44.
; PLAN: r0=136(x), r1=107(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 107
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

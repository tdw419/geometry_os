; DESCRIPTION: Composite: . Then Renders a red disk with center (62, 191) and radius 37. Then Places a magenta 21x44 rectangle at position (182, 127).
; PLAN: r0=62(x), r1=191(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=182(x), r1=127(y), r2=21(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (62, 191) and radius 37.
; PLAN: r0=62(x), r1=191(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 191
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 21x44 rectangle at position (182, 127).
; PLAN: r0=182(x), r1=127(y), r2=21(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 127
LDI r2, 21
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Places a yellow 58x60 rectangle at position (45, 5). Then Places a red circle of radius 71 at center (139, 177).
; PLAN: r0=45(x), r1=5(y), r2=58(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=139(x), r1=177(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 58x60 rectangle at position (45, 5).
; PLAN: r0=45(x), r1=5(y), r2=58(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 5
LDI r2, 58
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 71 at center (139, 177).
; PLAN: r0=139(x), r1=177(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 177
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

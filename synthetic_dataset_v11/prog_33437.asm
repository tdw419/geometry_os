; DESCRIPTION: Composite: . Then Places a black circle of radius 48 at center (113, 173). Then Places a cyan 120x69 rectangle at position (94, 108).
; PLAN: r0=113(x), r1=173(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=94(x), r1=108(y), r2=120(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 48 at center (113, 173).
; PLAN: r0=113(x), r1=173(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 173
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 120x69 rectangle at position (94, 108).
; PLAN: r0=94(x), r1=108(y), r2=120(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 108
LDI r2, 120
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

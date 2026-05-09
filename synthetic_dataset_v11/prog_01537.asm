; DESCRIPTION: Composite: . Then Renders a magenta disk with center (134, 193) and radius 15. Then Places a purple 112x24 rectangle at position (38, 197).
; PLAN: r0=134(x), r1=193(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=38(x), r1=197(y), r2=112(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (134, 193) and radius 15.
; PLAN: r0=134(x), r1=193(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 193
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 112x24 rectangle at position (38, 197).
; PLAN: r0=38(x), r1=197(y), r2=112(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 197
LDI r2, 112
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

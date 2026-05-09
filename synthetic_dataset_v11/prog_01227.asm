; DESCRIPTION: Composite: . Then Renders a yellow box of size 46x14 starting at (206, 197). Then Places a yellow circle of radius 12 at center (240, 141).
; PLAN: r0=206(x), r1=197(y), r2=46(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=240(x), r1=141(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 46x14 starting at (206, 197).
; PLAN: r0=206(x), r1=197(y), r2=46(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 197
LDI r2, 46
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 12 at center (240, 141).
; PLAN: r0=240(x), r1=141(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 141
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

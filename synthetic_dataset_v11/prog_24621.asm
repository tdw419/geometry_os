; DESCRIPTION: Composite: . Then Places a green circle of radius 49 at center (197, 197). Then Creates a red rectangular region at (4, 80) spanning 33 by 98 pixels.
; PLAN: r0=197(x), r1=197(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=4(x), r1=80(y), r2=33(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 49 at center (197, 197).
; PLAN: r0=197(x), r1=197(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 197
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (4, 80) spanning 33 by 98 pixels.
; PLAN: r0=4(x), r1=80(y), r2=33(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 80
LDI r2, 33
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

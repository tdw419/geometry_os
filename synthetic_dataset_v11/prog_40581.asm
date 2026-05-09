; DESCRIPTION: Composite: . Then Renders a black box of size 115x29 starting at (40, 82). Then Places a green circle of radius 48 at center (180, 129).
; PLAN: r0=40(x), r1=82(y), r2=115(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=129(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 115x29 starting at (40, 82).
; PLAN: r0=40(x), r1=82(y), r2=115(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 82
LDI r2, 115
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 48 at center (180, 129).
; PLAN: r0=180(x), r1=129(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 129
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Composite: . Then Places a black 26x86 rectangle at position (95, 96). Then Places a green circle of radius 10 at center (220, 171).
; PLAN: r0=95(x), r1=96(y), r2=26(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=220(x), r1=171(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 26x86 rectangle at position (95, 96).
; PLAN: r0=95(x), r1=96(y), r2=26(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 96
LDI r2, 26
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 10 at center (220, 171).
; PLAN: r0=220(x), r1=171(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 171
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

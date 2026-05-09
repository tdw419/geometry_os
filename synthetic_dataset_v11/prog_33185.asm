; DESCRIPTION: Composite: . Then Renders a cyan box of size 95x93 starting at (34, 122). Then Places a purple circle of radius 60 at center (109, 122).
; PLAN: r0=34(x), r1=122(y), r2=95(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=109(x), r1=122(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 95x93 starting at (34, 122).
; PLAN: r0=34(x), r1=122(y), r2=95(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 122
LDI r2, 95
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 60 at center (109, 122).
; PLAN: r0=109(x), r1=122(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 122
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

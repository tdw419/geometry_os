; DESCRIPTION: Composite: . Then Places a purple 29x41 rectangle at position (46, 204). Then Places a black circle of radius 61 at center (111, 93).
; PLAN: r0=46(x), r1=204(y), r2=29(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=93(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 29x41 rectangle at position (46, 204).
; PLAN: r0=46(x), r1=204(y), r2=29(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 204
LDI r2, 29
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black circle of radius 61 at center (111, 93).
; PLAN: r0=111(x), r1=93(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 93
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

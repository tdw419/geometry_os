; DESCRIPTION: Composite: . Then Places a blue dot at position (44, 148). Then Places a yellow 75x53 rectangle at position (58, 133).
; PLAN: r0=44(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=58(x), r1=133(y), r2=75(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (44, 148).
; PLAN: r0=44(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 148
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 75x53 rectangle at position (58, 133).
; PLAN: r0=58(x), r1=133(y), r2=75(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 133
LDI r2, 75
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

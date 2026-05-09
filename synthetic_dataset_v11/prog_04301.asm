; DESCRIPTION: Composite: . Then Places a blue dot at position (90, 13). Then Renders a yellow box of size 16x55 starting at (53, 141).
; PLAN: r0=90(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=53(x), r1=141(y), r2=16(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (90, 13).
; PLAN: r0=90(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 13
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 16x55 starting at (53, 141).
; PLAN: r0=53(x), r1=141(y), r2=16(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 141
LDI r2, 16
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

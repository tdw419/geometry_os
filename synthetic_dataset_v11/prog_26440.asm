; DESCRIPTION: Composite: . Then Places a red dot at position (4, 253). Then Places a yellow 59x84 rectangle at position (10, 73).
; PLAN: r0=4(x), r1=253(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=10(x), r1=73(y), r2=59(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (4, 253).
; PLAN: r0=4(x), r1=253(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 253
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 59x84 rectangle at position (10, 73).
; PLAN: r0=10(x), r1=73(y), r2=59(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 73
LDI r2, 59
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

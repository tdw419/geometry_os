; DESCRIPTION: Places a yellow 75x53 rectangle at position (310, 141).
; PLAN: r0=310(x), r1=141(y), r2=75(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 141
LDI r2, 75
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

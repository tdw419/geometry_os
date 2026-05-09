; DESCRIPTION: Places a black 43x53 rectangle at position (277, 36).
; PLAN: r0=277(x), r1=36(y), r2=43(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 36
LDI r2, 43
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

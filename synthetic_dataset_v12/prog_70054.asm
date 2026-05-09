; DESCRIPTION: Places a red 95x18 rectangle at position (240, 53).
; PLAN: r0=240(x), r1=53(y), r2=95(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 53
LDI r2, 95
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

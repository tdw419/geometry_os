; DESCRIPTION: Places a green 18x100 rectangle at position (445, 53).
; PLAN: r0=445(x), r1=53(y), r2=18(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 53
LDI r2, 18
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

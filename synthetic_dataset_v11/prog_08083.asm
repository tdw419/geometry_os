; DESCRIPTION: Places a red 56x100 rectangle at position (160, 53).
; PLAN: r0=160(x), r1=53(y), r2=56(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 53
LDI r2, 56
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

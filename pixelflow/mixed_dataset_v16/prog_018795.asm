; DESCRIPTION: Places a red 47x28 rectangle at position (282, 47).
; PLAN: r0=282(x), r1=47(y), r2=47(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 47
LDI r2, 47
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

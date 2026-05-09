; DESCRIPTION: Places a magenta 47x56 rectangle at position (292, 40).
; PLAN: r0=292(x), r1=40(y), r2=47(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 40
LDI r2, 47
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

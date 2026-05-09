; DESCRIPTION: Places a purple 76x44 rectangle at position (156, 40).
; PLAN: r0=156(x), r1=40(y), r2=76(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 40
LDI r2, 76
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

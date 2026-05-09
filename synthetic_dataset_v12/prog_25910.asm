; DESCRIPTION: Places a cyan 112x69 rectangle at position (183, 99).
; PLAN: r0=183(x), r1=99(y), r2=112(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 99
LDI r2, 112
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

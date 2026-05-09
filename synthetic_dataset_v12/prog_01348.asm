; DESCRIPTION: Places a cyan 52x112 rectangle at position (151, 69).
; PLAN: r0=151(x), r1=69(y), r2=52(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 69
LDI r2, 52
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

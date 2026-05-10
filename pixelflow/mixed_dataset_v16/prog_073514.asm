; DESCRIPTION: Places a green 99x15 rectangle at position (183, 241).
; PLAN: r0=183(x), r1=241(y), r2=99(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 241
LDI r2, 99
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

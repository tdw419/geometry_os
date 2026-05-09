; DESCRIPTION: Places a blue 34x17 rectangle at position (126, 27).
; PLAN: r0=126(x), r1=27(y), r2=34(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 27
LDI r2, 34
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

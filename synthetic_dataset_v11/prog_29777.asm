; DESCRIPTION: Places a yellow 30x27 rectangle at position (96, 62).
; PLAN: r0=96(x), r1=62(y), r2=30(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 62
LDI r2, 30
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

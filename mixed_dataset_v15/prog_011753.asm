; DESCRIPTION: Places a yellow 19x21 rectangle at position (19, 168).
; PLAN: r0=19(x), r1=168(y), r2=19(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 168
LDI r2, 19
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

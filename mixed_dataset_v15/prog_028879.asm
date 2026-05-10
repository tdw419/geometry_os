; DESCRIPTION: Places a green 100x21 rectangle at position (157, 27).
; PLAN: r0=157(x), r1=27(y), r2=100(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 27
LDI r2, 100
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

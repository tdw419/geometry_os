; DESCRIPTION: Places a green 93x54 rectangle at position (128, 27).
; PLAN: r0=128(x), r1=27(y), r2=93(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 27
LDI r2, 93
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

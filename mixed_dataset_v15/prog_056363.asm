; DESCRIPTION: Places a green 43x86 rectangle at position (463, 90).
; PLAN: r0=463(x), r1=90(y), r2=43(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 90
LDI r2, 43
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

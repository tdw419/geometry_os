; DESCRIPTION: Places a red 76x54 rectangle at position (253, 127).
; PLAN: r0=253(x), r1=127(y), r2=76(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 127
LDI r2, 76
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

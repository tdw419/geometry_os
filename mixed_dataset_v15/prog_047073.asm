; DESCRIPTION: Places a green 36x96 rectangle at position (68, 89).
; PLAN: r0=68(x), r1=89(y), r2=36(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 89
LDI r2, 36
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

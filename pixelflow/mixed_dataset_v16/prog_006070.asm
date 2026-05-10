; DESCRIPTION: Places a green 23x120 rectangle at position (116, 8).
; PLAN: r0=116(x), r1=8(y), r2=23(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 8
LDI r2, 23
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

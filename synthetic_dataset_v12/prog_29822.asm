; DESCRIPTION: Places a green 30x102 rectangle at position (2, 13).
; PLAN: r0=2(x), r1=13(y), r2=30(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 13
LDI r2, 30
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

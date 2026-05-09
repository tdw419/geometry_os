; DESCRIPTION: Places a green 62x56 rectangle at position (242, 35).
; PLAN: r0=242(x), r1=35(y), r2=62(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 35
LDI r2, 62
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

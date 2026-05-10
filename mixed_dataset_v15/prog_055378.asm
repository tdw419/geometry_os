; DESCRIPTION: Places a green 37x62 rectangle at position (242, 157).
; PLAN: r0=242(x), r1=157(y), r2=37(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 157
LDI r2, 37
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green 37x29 rectangle at position (161, 192).
; PLAN: r0=161(x), r1=192(y), r2=37(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 192
LDI r2, 37
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

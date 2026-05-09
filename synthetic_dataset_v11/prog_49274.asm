; DESCRIPTION: Places a yellow 57x65 rectangle at position (192, 32).
; PLAN: r0=192(x), r1=32(y), r2=57(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 32
LDI r2, 57
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

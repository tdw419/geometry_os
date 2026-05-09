; DESCRIPTION: Places a yellow 115x49 rectangle at position (32, 57).
; PLAN: r0=32(x), r1=57(y), r2=115(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 57
LDI r2, 115
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

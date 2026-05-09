; DESCRIPTION: Places a black 42x108 rectangle at position (274, 144).
; PLAN: r0=274(x), r1=144(y), r2=42(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 144
LDI r2, 42
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow 94x32 rectangle at position (122, 20).
; PLAN: r0=122(x), r1=20(y), r2=94(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 20
LDI r2, 94
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

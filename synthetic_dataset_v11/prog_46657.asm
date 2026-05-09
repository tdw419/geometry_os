; DESCRIPTION: Places a yellow 24x94 rectangle at position (128, 36).
; PLAN: r0=128(x), r1=36(y), r2=24(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 36
LDI r2, 24
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

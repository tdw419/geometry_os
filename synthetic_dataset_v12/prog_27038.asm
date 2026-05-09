; DESCRIPTION: Places a red 17x64 rectangle at position (24, 181).
; PLAN: r0=24(x), r1=181(y), r2=17(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 181
LDI r2, 17
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

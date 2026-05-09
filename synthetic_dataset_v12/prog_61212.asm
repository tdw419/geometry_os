; DESCRIPTION: Places a black 32x40 rectangle at position (59, 164).
; PLAN: r0=59(x), r1=164(y), r2=32(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 164
LDI r2, 32
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

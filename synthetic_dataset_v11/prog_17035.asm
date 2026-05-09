; DESCRIPTION: Places a yellow 101x86 rectangle at position (32, 18).
; PLAN: r0=32(x), r1=18(y), r2=101(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 18
LDI r2, 101
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

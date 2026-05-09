; DESCRIPTION: Places a yellow 29x64 rectangle at position (399, 7).
; PLAN: r0=399(x), r1=7(y), r2=29(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 7
LDI r2, 29
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

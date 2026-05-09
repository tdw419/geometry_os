; DESCRIPTION: Places a yellow 32x66 rectangle at position (473, 27).
; PLAN: r0=473(x), r1=27(y), r2=32(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 27
LDI r2, 32
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

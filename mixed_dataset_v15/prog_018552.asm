; DESCRIPTION: Places a yellow 74x77 rectangle at position (399, 32).
; PLAN: r0=399(x), r1=32(y), r2=74(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 32
LDI r2, 74
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

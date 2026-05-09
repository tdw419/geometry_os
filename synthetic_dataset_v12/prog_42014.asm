; DESCRIPTION: Places a yellow 27x92 rectangle at position (8, 31).
; PLAN: r0=8(x), r1=31(y), r2=27(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 31
LDI r2, 27
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

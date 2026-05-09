; DESCRIPTION: Places a red 52x27 rectangle at position (181, 32).
; PLAN: r0=181(x), r1=32(y), r2=52(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 32
LDI r2, 52
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

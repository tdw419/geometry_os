; DESCRIPTION: Places a red 101x52 rectangle at position (7, 27).
; PLAN: r0=7(x), r1=27(y), r2=101(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 27
LDI r2, 101
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

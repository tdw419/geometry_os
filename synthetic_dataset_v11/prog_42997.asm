; DESCRIPTION: Places a red 52x11 rectangle at position (25, 167).
; PLAN: r0=25(x), r1=167(y), r2=52(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 167
LDI r2, 52
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

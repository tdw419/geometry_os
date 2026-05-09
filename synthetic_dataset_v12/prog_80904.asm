; DESCRIPTION: Places a yellow 52x113 rectangle at position (233, 19).
; PLAN: r0=233(x), r1=19(y), r2=52(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 19
LDI r2, 52
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

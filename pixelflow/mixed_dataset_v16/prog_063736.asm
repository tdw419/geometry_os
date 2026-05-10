; DESCRIPTION: Places a red 99x19 rectangle at position (233, 204).
; PLAN: r0=233(x), r1=204(y), r2=99(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 204
LDI r2, 99
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red 24x39 rectangle at position (233, 39).
; PLAN: r0=233(x), r1=39(y), r2=24(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 39
LDI r2, 24
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

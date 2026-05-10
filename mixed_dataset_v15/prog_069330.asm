; DESCRIPTION: Places a red 111x19 rectangle at position (52, 49).
; PLAN: r0=52(x), r1=49(y), r2=111(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 49
LDI r2, 111
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

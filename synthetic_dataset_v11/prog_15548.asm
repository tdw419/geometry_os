; DESCRIPTION: Places a red 55x11 rectangle at position (111, 49).
; PLAN: r0=111(x), r1=49(y), r2=55(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 49
LDI r2, 55
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

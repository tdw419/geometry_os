; DESCRIPTION: Places a white 35x111 rectangle at position (170, 39).
; PLAN: r0=170(x), r1=39(y), r2=35(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 39
LDI r2, 35
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow 39x28 rectangle at position (341, 104).
; PLAN: r0=341(x), r1=104(y), r2=39(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 104
LDI r2, 39
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

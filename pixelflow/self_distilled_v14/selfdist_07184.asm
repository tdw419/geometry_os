; DESCRIPTION: Places a white 111x23 box at position (341, 36).
; PLAN: r0=341(x), r1=36(y), r2=111(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 36
LDI r2, 111
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

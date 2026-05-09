; DESCRIPTION: Places a black 111x75 rectangle at position (43, 52).
; PLAN: r0=43(x), r1=52(y), r2=111(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 52
LDI r2, 111
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

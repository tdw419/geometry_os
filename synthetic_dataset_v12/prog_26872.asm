; DESCRIPTION: Places a white 25x25 rectangle at position (391, 56).
; PLAN: r0=391(x), r1=56(y), r2=25(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 56
LDI r2, 25
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

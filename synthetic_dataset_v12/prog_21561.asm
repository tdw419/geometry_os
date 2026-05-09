; DESCRIPTION: Places a white 39x17 rectangle at position (362, 97).
; PLAN: r0=362(x), r1=97(y), r2=39(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 97
LDI r2, 39
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

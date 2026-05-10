; DESCRIPTION: Places a white 111x19 box at position (153, 87).
; PLAN: r0=153(x), r1=87(y), r2=111(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 87
LDI r2, 111
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

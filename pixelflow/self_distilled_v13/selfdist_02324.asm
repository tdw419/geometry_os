; DESCRIPTION: Places a white 113x19 box at position (175, 140).
; PLAN: r0=175(x), r1=140(y), r2=113(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 140
LDI r2, 113
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

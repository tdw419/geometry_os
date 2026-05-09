; DESCRIPTION: Places a white 14x94 rectangle at position (306, 19).
; PLAN: r0=306(x), r1=19(y), r2=14(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 19
LDI r2, 14
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

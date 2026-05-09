; DESCRIPTION: Places a white 56x17 rectangle at position (370, 134).
; PLAN: r0=370(x), r1=134(y), r2=56(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 134
LDI r2, 56
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

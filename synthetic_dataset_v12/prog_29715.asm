; DESCRIPTION: Places a white 103x15 rectangle at position (370, 132).
; PLAN: r0=370(x), r1=132(y), r2=103(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 132
LDI r2, 103
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

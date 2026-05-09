; DESCRIPTION: Places a white 14x34 rectangle at position (174, 3).
; PLAN: r0=174(x), r1=3(y), r2=14(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 3
LDI r2, 14
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

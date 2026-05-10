; DESCRIPTION: Places a white 113x23 box at position (217, 22).
; PLAN: r0=217(x), r1=22(y), r2=113(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 22
LDI r2, 113
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

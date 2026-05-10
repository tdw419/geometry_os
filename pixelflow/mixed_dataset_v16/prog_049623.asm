; DESCRIPTION: Places a white 113x91 rectangle at position (203, 2).
; PLAN: r0=203(x), r1=2(y), r2=113(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 2
LDI r2, 113
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

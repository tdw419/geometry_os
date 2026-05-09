; DESCRIPTION: Places a white 16x17 rectangle at position (56, 113).
; PLAN: r0=56(x), r1=113(y), r2=16(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 113
LDI r2, 16
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

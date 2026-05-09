; DESCRIPTION: Places a white 17x29 rectangle at position (346, 198).
; PLAN: r0=346(x), r1=198(y), r2=17(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 198
LDI r2, 17
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

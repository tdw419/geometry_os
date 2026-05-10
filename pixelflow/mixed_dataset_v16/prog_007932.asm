; DESCRIPTION: Places a white 17x57 rectangle at position (435, 198).
; PLAN: r0=435(x), r1=198(y), r2=17(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 198
LDI r2, 17
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

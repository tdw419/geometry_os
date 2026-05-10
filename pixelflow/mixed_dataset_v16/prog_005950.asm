; DESCRIPTION: Places a white 80x17 rectangle at position (303, 163).
; PLAN: r0=303(x), r1=163(y), r2=80(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 163
LDI r2, 80
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

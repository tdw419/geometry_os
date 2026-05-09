; DESCRIPTION: Places a white 58x20 rectangle at position (336, 29).
; PLAN: r0=336(x), r1=29(y), r2=58(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 29
LDI r2, 58
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

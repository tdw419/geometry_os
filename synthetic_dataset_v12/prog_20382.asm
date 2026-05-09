; DESCRIPTION: Places a white 96x55 rectangle at position (86, 17).
; PLAN: r0=86(x), r1=17(y), r2=96(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 17
LDI r2, 96
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

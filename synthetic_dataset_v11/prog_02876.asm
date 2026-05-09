; DESCRIPTION: Places a white 38x55 rectangle at position (205, 170).
; PLAN: r0=205(x), r1=170(y), r2=38(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 170
LDI r2, 38
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

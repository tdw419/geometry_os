; DESCRIPTION: Places a white 35x11 rectangle at position (55, 50).
; PLAN: r0=55(x), r1=50(y), r2=35(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 50
LDI r2, 35
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

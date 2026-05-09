; DESCRIPTION: Places a white 73x55 rectangle at position (81, 50).
; PLAN: r0=81(x), r1=50(y), r2=73(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 50
LDI r2, 73
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

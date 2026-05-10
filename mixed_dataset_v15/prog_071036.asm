; DESCRIPTION: Places a white 55x74 rectangle at position (273, 81).
; PLAN: r0=273(x), r1=81(y), r2=55(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 81
LDI r2, 55
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

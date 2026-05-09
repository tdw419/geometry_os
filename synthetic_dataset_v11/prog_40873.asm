; DESCRIPTION: Places a white 52x53 rectangle at position (38, 123).
; PLAN: r0=38(x), r1=123(y), r2=52(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 123
LDI r2, 52
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

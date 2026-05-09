; DESCRIPTION: Places a white 95x53 rectangle at position (275, 81).
; PLAN: r0=275(x), r1=81(y), r2=95(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 81
LDI r2, 95
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

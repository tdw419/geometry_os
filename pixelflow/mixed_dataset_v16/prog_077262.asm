; DESCRIPTION: Places a white 71x53 rectangle at position (70, 65).
; PLAN: r0=70(x), r1=65(y), r2=71(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 65
LDI r2, 71
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

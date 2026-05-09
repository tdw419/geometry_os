; DESCRIPTION: Places a red 44x53 rectangle at position (124, 121).
; PLAN: r0=124(x), r1=121(y), r2=44(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 121
LDI r2, 44
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

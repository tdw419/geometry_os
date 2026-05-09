; DESCRIPTION: Places a red 64x53 rectangle at position (46, 73).
; PLAN: r0=46(x), r1=73(y), r2=64(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 73
LDI r2, 64
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

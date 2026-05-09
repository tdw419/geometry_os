; DESCRIPTION: Places a red 98x73 rectangle at position (275, 53).
; PLAN: r0=275(x), r1=53(y), r2=98(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 53
LDI r2, 98
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

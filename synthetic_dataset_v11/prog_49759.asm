; DESCRIPTION: Places a red 53x20 rectangle at position (187, 46).
; PLAN: r0=187(x), r1=46(y), r2=53(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 46
LDI r2, 53
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

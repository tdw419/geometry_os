; DESCRIPTION: Places a red 16x74 rectangle at position (437, 46).
; PLAN: r0=437(x), r1=46(y), r2=16(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 46
LDI r2, 16
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

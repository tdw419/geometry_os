; DESCRIPTION: Places a orange 66x106 rectangle at position (215, 121).
; PLAN: r0=215(x), r1=121(y), r2=66(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 121
LDI r2, 66
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

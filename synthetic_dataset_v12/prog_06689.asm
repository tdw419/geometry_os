; DESCRIPTION: Places a red 55x106 rectangle at position (338, 121).
; PLAN: r0=338(x), r1=121(y), r2=55(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 121
LDI r2, 55
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

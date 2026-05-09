; DESCRIPTION: Places a red 45x34 rectangle at position (456, 202).
; PLAN: r0=456(x), r1=202(y), r2=45(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 202
LDI r2, 45
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

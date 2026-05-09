; DESCRIPTION: Places a red 23x95 rectangle at position (38, 46).
; PLAN: r0=38(x), r1=46(y), r2=23(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 46
LDI r2, 23
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

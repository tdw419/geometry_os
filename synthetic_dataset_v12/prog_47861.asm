; DESCRIPTION: Creates a red rectangular region at (202, 131) spanning 53 by 23 pixels.
; PLAN: r0=202(x), r1=131(y), r2=53(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 131
LDI r2, 53
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

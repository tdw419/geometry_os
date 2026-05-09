; DESCRIPTION: Creates a red rectangular region at (184, 131) spanning 64 by 23 pixels.
; PLAN: r0=184(x), r1=131(y), r2=64(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 131
LDI r2, 64
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

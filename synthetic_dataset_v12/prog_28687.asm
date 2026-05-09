; DESCRIPTION: Creates a red rectangular region at (327, 121) spanning 40 by 16 pixels.
; PLAN: r0=327(x), r1=121(y), r2=40(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 121
LDI r2, 40
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

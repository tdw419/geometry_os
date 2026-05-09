; DESCRIPTION: Creates a white rectangular region at (168, 121) spanning 74 by 117 pixels.
; PLAN: r0=168(x), r1=121(y), r2=74(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 121
LDI r2, 74
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

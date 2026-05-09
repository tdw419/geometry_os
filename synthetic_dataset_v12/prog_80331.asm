; DESCRIPTION: Creates a red rectangular region at (488, 151) spanning 12 by 68 pixels.
; PLAN: r0=488(x), r1=151(y), r2=12(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 151
LDI r2, 12
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

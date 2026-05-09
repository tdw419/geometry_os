; DESCRIPTION: Creates a red rectangular region at (168, 166) spanning 67 by 73 pixels.
; PLAN: r0=168(x), r1=166(y), r2=67(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 166
LDI r2, 67
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

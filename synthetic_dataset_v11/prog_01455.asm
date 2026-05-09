; DESCRIPTION: Creates a red rectangular region at (197, 67) spanning 27 by 34 pixels.
; PLAN: r0=197(x), r1=67(y), r2=27(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 67
LDI r2, 27
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

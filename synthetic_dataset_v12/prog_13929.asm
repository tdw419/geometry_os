; DESCRIPTION: Creates a red rectangular region at (197, 183) spanning 72 by 17 pixels.
; PLAN: r0=197(x), r1=183(y), r2=72(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 183
LDI r2, 72
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

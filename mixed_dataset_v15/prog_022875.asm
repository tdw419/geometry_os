; DESCRIPTION: Creates a black rectangular region at (197, 166) spanning 61 by 36 pixels.
; PLAN: r0=197(x), r1=166(y), r2=61(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 166
LDI r2, 61
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

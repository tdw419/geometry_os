; DESCRIPTION: Creates a black rectangular region at (91, 197) spanning 39 by 49 pixels.
; PLAN: r0=91(x), r1=197(y), r2=39(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 197
LDI r2, 39
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

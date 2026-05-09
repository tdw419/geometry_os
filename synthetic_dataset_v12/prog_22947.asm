; DESCRIPTION: Creates a black rectangular region at (160, 146) spanning 39 by 61 pixels.
; PLAN: r0=160(x), r1=146(y), r2=39(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 146
LDI r2, 39
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

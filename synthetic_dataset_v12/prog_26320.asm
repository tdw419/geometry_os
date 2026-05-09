; DESCRIPTION: Creates a black rectangular region at (330, 209) spanning 59 by 25 pixels.
; PLAN: r0=330(x), r1=209(y), r2=59(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 209
LDI r2, 59
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

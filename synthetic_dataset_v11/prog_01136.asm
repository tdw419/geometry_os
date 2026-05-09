; DESCRIPTION: Creates a white rectangular region at (59, 65) spanning 16 by 39 pixels.
; PLAN: r0=59(x), r1=65(y), r2=16(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 65
LDI r2, 16
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (330, 71) spanning 32 by 59 pixels.
; PLAN: r0=330(x), r1=71(y), r2=32(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 71
LDI r2, 32
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

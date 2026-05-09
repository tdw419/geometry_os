; DESCRIPTION: Creates a white rectangular region at (113, 46) spanning 61 by 16 pixels.
; PLAN: r0=113(x), r1=46(y), r2=61(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 61
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (394, 151) spanning 109 by 59 pixels.
; PLAN: r0=394(x), r1=151(y), r2=109(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 151
LDI r2, 109
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white rectangular region spanning 34 by 59 at (304, 162).
; PLAN: r0=304(x), r1=162(y), r2=34(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 162
LDI r2, 34
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

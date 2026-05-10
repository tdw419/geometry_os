; DESCRIPTION: Renders a red rectangular region spanning 59 by 76 at (166, 8).
; PLAN: r0=166(x), r1=8(y), r2=59(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 8
LDI r2, 59
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

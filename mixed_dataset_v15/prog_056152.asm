; DESCRIPTION: Renders a red rectangular region spanning 45 by 26 at (157, 84).
; PLAN: r0=157(x), r1=84(y), r2=45(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 84
LDI r2, 45
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

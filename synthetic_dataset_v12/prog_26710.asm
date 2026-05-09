; DESCRIPTION: Renders a orange box of size 78x111 starting at (140, 82).
; PLAN: r0=140(x), r1=82(y), r2=78(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 82
LDI r2, 78
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

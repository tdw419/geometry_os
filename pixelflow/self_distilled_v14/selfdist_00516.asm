; DESCRIPTION: Renders a red rectangular region spanning 13 by 38 at (108, 29).
; PLAN: r0=108(x), r1=29(y), r2=13(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 29
LDI r2, 13
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

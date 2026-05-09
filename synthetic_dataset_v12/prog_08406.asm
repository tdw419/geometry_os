; DESCRIPTION: Renders a orange box of size 29x111 starting at (448, 71).
; PLAN: r0=448(x), r1=71(y), r2=29(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 71
LDI r2, 29
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

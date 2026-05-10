; DESCRIPTION: Renders a orange rectangular region spanning 47 by 113 at (340, 163).
; PLAN: r0=340(x), r1=163(y), r2=47(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 163
LDI r2, 47
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

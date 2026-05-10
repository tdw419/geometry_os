; DESCRIPTION: Renders a orange rectangular region spanning 64 by 49 at (156, 171).
; PLAN: r0=156(x), r1=171(y), r2=64(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 171
LDI r2, 64
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

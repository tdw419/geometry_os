; DESCRIPTION: Renders a purple rectangular region spanning 109 by 83 at (82, 173).
; PLAN: r0=82(x), r1=173(y), r2=109(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 173
LDI r2, 109
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

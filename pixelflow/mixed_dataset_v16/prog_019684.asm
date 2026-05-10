; DESCRIPTION: Renders a red rectangular region spanning 31 by 82 at (245, 30).
; PLAN: r0=245(x), r1=30(y), r2=31(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 30
LDI r2, 31
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

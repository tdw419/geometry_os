; DESCRIPTION: Renders a white rectangular region spanning 82 by 53 at (307, 178).
; PLAN: r0=307(x), r1=178(y), r2=82(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 178
LDI r2, 82
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

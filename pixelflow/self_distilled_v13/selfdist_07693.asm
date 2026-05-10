; DESCRIPTION: Renders a white rectangular region spanning 71 by 79 at (327, 109).
; PLAN: r0=327(x), r1=109(y), r2=71(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 109
LDI r2, 71
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

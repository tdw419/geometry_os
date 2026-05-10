; DESCRIPTION: Renders a white rectangular region spanning 70 by 12 at (327, 173).
; PLAN: r0=327(x), r1=173(y), r2=70(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 173
LDI r2, 70
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

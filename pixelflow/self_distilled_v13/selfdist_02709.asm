; DESCRIPTION: Renders a white rectangular region spanning 42 by 108 at (143, 6).
; PLAN: r0=143(x), r1=6(y), r2=42(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 6
LDI r2, 42
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

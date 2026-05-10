; DESCRIPTION: Renders a white rectangular region spanning 120 by 79 at (294, 149).
; PLAN: r0=294(x), r1=149(y), r2=120(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 149
LDI r2, 120
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

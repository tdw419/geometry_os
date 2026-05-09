; DESCRIPTION: Renders a white box of size 79x82 starting at (300, 131).
; PLAN: r0=300(x), r1=131(y), r2=79(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 131
LDI r2, 79
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 92x82 starting at (80, 91).
; PLAN: r0=80(x), r1=91(y), r2=92(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 91
LDI r2, 92
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

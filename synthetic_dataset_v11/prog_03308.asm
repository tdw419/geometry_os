; DESCRIPTION: Renders a white box of size 92x91 starting at (70, 157).
; PLAN: r0=70(x), r1=157(y), r2=92(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 157
LDI r2, 92
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

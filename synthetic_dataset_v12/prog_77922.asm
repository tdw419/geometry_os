; DESCRIPTION: Renders a white box of size 48x76 starting at (273, 5).
; PLAN: r0=273(x), r1=5(y), r2=48(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 5
LDI r2, 48
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

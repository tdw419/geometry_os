; DESCRIPTION: Renders a white box of size 50x30 starting at (156, 55).
; PLAN: r0=156(x), r1=55(y), r2=50(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 55
LDI r2, 50
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 95x50 starting at (13, 127).
; PLAN: r0=13(x), r1=127(y), r2=95(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 127
LDI r2, 95
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

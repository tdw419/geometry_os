; DESCRIPTION: Renders a white box of size 95x34 starting at (255, 84).
; PLAN: r0=255(x), r1=84(y), r2=95(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 84
LDI r2, 95
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

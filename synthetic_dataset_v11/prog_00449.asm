; DESCRIPTION: Renders a white box of size 57x90 starting at (38, 155).
; PLAN: r0=38(x), r1=155(y), r2=57(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 155
LDI r2, 57
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

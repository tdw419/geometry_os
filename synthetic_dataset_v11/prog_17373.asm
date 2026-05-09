; DESCRIPTION: Renders a white box of size 75x76 starting at (180, 144).
; PLAN: r0=180(x), r1=144(y), r2=75(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 144
LDI r2, 75
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

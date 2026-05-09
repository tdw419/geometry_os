; DESCRIPTION: Renders a white box of size 119x80 starting at (146, 157).
; PLAN: r0=146(x), r1=157(y), r2=119(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 157
LDI r2, 119
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

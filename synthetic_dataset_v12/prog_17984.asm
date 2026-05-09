; DESCRIPTION: Renders a white box of size 86x64 starting at (149, 148).
; PLAN: r0=149(x), r1=148(y), r2=86(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 148
LDI r2, 86
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

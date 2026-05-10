; DESCRIPTION: Renders a green box of size 61x36 starting at (157, 9).
; PLAN: r0=157(x), r1=9(y), r2=61(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 9
LDI r2, 61
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

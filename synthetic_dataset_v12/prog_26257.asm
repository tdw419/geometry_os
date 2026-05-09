; DESCRIPTION: Renders a green box of size 61x69 starting at (239, 8).
; PLAN: r0=239(x), r1=8(y), r2=61(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 8
LDI r2, 61
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

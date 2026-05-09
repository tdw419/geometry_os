; DESCRIPTION: Renders a green box of size 55x26 starting at (116, 57).
; PLAN: r0=116(x), r1=57(y), r2=55(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 57
LDI r2, 55
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

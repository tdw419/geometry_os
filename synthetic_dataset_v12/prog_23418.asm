; DESCRIPTION: Renders a green box of size 76x115 starting at (116, 12).
; PLAN: r0=116(x), r1=12(y), r2=76(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 12
LDI r2, 76
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

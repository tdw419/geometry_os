; DESCRIPTION: Renders a green box of size 116x93 starting at (298, 76).
; PLAN: r0=298(x), r1=76(y), r2=116(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 76
LDI r2, 116
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green 45x116 rectangle at position (303, 43).
; PLAN: r0=303(x), r1=43(y), r2=45(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 43
LDI r2, 45
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

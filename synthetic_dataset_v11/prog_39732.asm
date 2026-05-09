; DESCRIPTION: Composite: . Then Places a white dot at position (253, 149). Then Renders a orange box of size 68x58 starting at (31, 88).
; PLAN: r0=253(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=31(x), r1=88(y), r2=68(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (253, 149).
; PLAN: r0=253(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 68x58 starting at (31, 88).
; PLAN: r0=31(x), r1=88(y), r2=68(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 88
LDI r2, 68
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

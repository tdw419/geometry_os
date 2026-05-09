; DESCRIPTION: Composite: . Then Places a white dot at position (62, 149). Then Renders a black box of size 39x76 starting at (120, 158).
; PLAN: r0=62(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=120(x), r1=158(y), r2=39(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (62, 149).
; PLAN: r0=62(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 39x76 starting at (120, 158).
; PLAN: r0=120(x), r1=158(y), r2=39(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 158
LDI r2, 39
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

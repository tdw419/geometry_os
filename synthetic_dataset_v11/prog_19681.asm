; DESCRIPTION: Composite: . Then Places a white dot at position (29, 107). Then Renders a yellow box of size 29x18 starting at (103, 151).
; PLAN: r0=29(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=151(y), r2=29(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (29, 107).
; PLAN: r0=29(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 29x18 starting at (103, 151).
; PLAN: r0=103(x), r1=151(y), r2=29(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 151
LDI r2, 29
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

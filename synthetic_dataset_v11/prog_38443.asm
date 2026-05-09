; DESCRIPTION: Composite: . Then Places a black dot at position (178, 171). Then Renders a red box of size 101x95 starting at (101, 102).
; PLAN: r0=178(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=101(x), r1=102(y), r2=101(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (178, 171).
; PLAN: r0=178(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 101x95 starting at (101, 102).
; PLAN: r0=101(x), r1=102(y), r2=101(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 102
LDI r2, 101
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

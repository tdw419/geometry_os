; DESCRIPTION: Composite: . Then Places a white dot at position (189, 156). Then Renders a red box of size 113x15 starting at (65, 20).
; PLAN: r0=189(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=20(y), r2=113(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (189, 156).
; PLAN: r0=189(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 156
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a red box of size 113x15 starting at (65, 20).
; PLAN: r0=65(x), r1=20(y), r2=113(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 20
LDI r2, 113
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Renders a black box of size 48x39 starting at (116, 205). Then Sets a single red pixel at (161, 59).
; PLAN: r0=116(x), r1=205(y), r2=48(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=161(x), r1=59(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black box of size 48x39 starting at (116, 205).
; PLAN: r0=116(x), r1=205(y), r2=48(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 205
LDI r2, 48
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (161, 59).
; PLAN: r0=161(x), r1=59(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 59
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT

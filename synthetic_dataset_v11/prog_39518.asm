; DESCRIPTION: Composite: . Then Renders a red box of size 15x79 starting at (38, 28). Then Sets a single white pixel at (67, 162).
; PLAN: r0=38(x), r1=28(y), r2=15(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x), r1=162(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 15x79 starting at (38, 28).
; PLAN: r0=38(x), r1=28(y), r2=15(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 28
LDI r2, 15
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (67, 162).
; PLAN: r0=67(x), r1=162(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 162
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

; DESCRIPTION: Composite: . Then Sets a single black pixel at (0, 60). Then Renders a orange box of size 73x64 starting at (135, 25).
; PLAN: r0=0(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=25(y), r2=73(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (0, 60).
; PLAN: r0=0(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 73x64 starting at (135, 25).
; PLAN: r0=135(x), r1=25(y), r2=73(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 25
LDI r2, 73
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: Sets a single purple pixel at (135, 73) then Renders a red box of size 34x102 starting at (333, 122).
; PLAN: r0=135(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=122(y), r7=34(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 333
LDI r6, 122
LDI r7, 34
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

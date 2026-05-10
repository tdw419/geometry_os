; DESCRIPTION: Composite: Sets a single yellow pixel at (118, 141) then Renders a red box of size 116x103 starting at (300, 144).
; PLAN: r0=118(x), r1=141(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=144(y), r7=116(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 141
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 144
LDI r7, 116
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT

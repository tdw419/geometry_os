; DESCRIPTION: Renders a red box of size 109x77 starting at (235, 139).
; PLAN: r0=235(x), r1=139(y), r2=109(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 139
LDI r2, 109
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

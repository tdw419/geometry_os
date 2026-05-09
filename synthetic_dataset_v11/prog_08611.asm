; DESCRIPTION: Composite: . Then Sets a single green pixel at (235, 14). Then Renders a yellow box of size 28x47 starting at (20, 169).
; PLAN: r0=235(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=20(x), r1=169(y), r2=28(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (235, 14).
; PLAN: r0=235(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 28x47 starting at (20, 169).
; PLAN: r0=20(x), r1=169(y), r2=28(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 169
LDI r2, 28
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

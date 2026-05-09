; DESCRIPTION: Composite: . Then Sets a single red pixel at (169, 235). Then Draws a cyan rectangle at (53, 203) with width 17 and height 27.
; PLAN: r0=169(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=53(x), r1=203(y), r2=17(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (169, 235).
; PLAN: r0=169(x), r1=235(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 235
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (53, 203) with width 17 and height 27.
; PLAN: r0=53(x), r1=203(y), r2=17(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 203
LDI r2, 17
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

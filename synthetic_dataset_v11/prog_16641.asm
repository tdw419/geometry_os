; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (135, 136) with width 30 and height 108. Then Sets a single cyan pixel at (171, 73).
; PLAN: r0=135(x), r1=136(y), r2=30(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=171(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (135, 136) with width 30 and height 108.
; PLAN: r0=135(x), r1=136(y), r2=30(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 136
LDI r2, 30
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (171, 73).
; PLAN: r0=171(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT

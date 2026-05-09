; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (38, 147). Then Draws a white rectangle at (43, 87) with width 62 and height 113.
; PLAN: r0=38(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=43(x), r1=87(y), r2=62(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (38, 147).
; PLAN: r0=38(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 147
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (43, 87) with width 62 and height 113.
; PLAN: r0=43(x), r1=87(y), r2=62(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 87
LDI r2, 62
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Draws a red rectangle at (182, 121) with width 63 and height 38. Then Sets a single white pixel at (108, 112).
; PLAN: r0=182(x), r1=121(y), r2=63(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (182, 121) with width 63 and height 38.
; PLAN: r0=182(x), r1=121(y), r2=63(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 121
LDI r2, 63
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (108, 112).
; PLAN: r0=108(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

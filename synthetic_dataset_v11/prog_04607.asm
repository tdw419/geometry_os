; DESCRIPTION: Composite: . Then Sets a single white pixel at (28, 121). Then Draws a white rectangle at (20, 33) with width 42 and height 105.
; PLAN: r0=28(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=20(x), r1=33(y), r2=42(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (28, 121).
; PLAN: r0=28(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (20, 33) with width 42 and height 105.
; PLAN: r0=20(x), r1=33(y), r2=42(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 33
LDI r2, 42
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

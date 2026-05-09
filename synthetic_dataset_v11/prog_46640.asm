; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (80, 113). Then Renders a white box of size 73x65 starting at (4, 180).
; PLAN: r0=80(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=4(x), r1=180(y), r2=73(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (80, 113).
; PLAN: r0=80(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 113
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 73x65 starting at (4, 180).
; PLAN: r0=4(x), r1=180(y), r2=73(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 180
LDI r2, 73
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

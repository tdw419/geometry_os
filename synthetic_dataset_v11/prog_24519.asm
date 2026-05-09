; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (22, 2). Then Renders a yellow box of size 62x77 starting at (135, 154).
; PLAN: r0=22(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=154(y), r2=62(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (22, 2).
; PLAN: r0=22(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 2
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 62x77 starting at (135, 154).
; PLAN: r0=135(x), r1=154(y), r2=62(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 154
LDI r2, 62
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

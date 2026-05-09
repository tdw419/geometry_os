; DESCRIPTION: Composite: . Then Renders a red box of size 85x115 starting at (110, 58). Then Places a green dot at position (89, 151).
; PLAN: r0=110(x), r1=58(y), r2=85(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=89(x), r1=151(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 85x115 starting at (110, 58).
; PLAN: r0=110(x), r1=58(y), r2=85(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 58
LDI r2, 85
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (89, 151).
; PLAN: r0=89(x), r1=151(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 151
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT

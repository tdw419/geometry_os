; DESCRIPTION: Composite: . Then Renders a purple box of size 120x67 starting at (121, 104). Then Sets a single yellow pixel at (249, 231).
; PLAN: r0=121(x), r1=104(y), r2=120(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=231(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple box of size 120x67 starting at (121, 104).
; PLAN: r0=121(x), r1=104(y), r2=120(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 104
LDI r2, 120
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (249, 231).
; PLAN: r0=249(x), r1=231(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 231
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT

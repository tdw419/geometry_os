; DESCRIPTION: Composite: . Then Sets a single purple pixel at (243, 121). Then Renders a orange box of size 50x16 starting at (137, 131).
; PLAN: r0=243(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=137(x), r1=131(y), r2=50(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (243, 121).
; PLAN: r0=243(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 50x16 starting at (137, 131).
; PLAN: r0=137(x), r1=131(y), r2=50(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 131
LDI r2, 50
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

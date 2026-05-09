; DESCRIPTION: Composite: . Then Renders a cyan box of size 51x41 starting at (123, 10). Then Draws a magenta circle centered at (90, 180) with radius 60.
; PLAN: r0=123(x), r1=10(y), r2=51(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=180(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 51x41 starting at (123, 10).
; PLAN: r0=123(x), r1=10(y), r2=51(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 10
LDI r2, 51
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (90, 180) with radius 60.
; PLAN: r0=90(x), r1=180(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 180
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Composite: . Then Renders a yellow box of size 85x54 starting at (96, 92). Then Places a magenta dot at position (90, 219).
; PLAN: r0=96(x), r1=92(y), r2=85(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=219(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 85x54 starting at (96, 92).
; PLAN: r0=96(x), r1=92(y), r2=85(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 92
LDI r2, 85
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (90, 219).
; PLAN: r0=90(x), r1=219(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 219
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT

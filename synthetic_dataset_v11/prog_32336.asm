; DESCRIPTION: Composite: . Then Renders a cyan box of size 50x45 starting at (75, 194). Then Renders a magenta disk with center (164, 44) and radius 18.
; PLAN: r0=75(x), r1=194(y), r2=50(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=164(x), r1=44(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 50x45 starting at (75, 194).
; PLAN: r0=75(x), r1=194(y), r2=50(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 194
LDI r2, 50
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (164, 44) and radius 18.
; PLAN: r0=164(x), r1=44(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 44
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

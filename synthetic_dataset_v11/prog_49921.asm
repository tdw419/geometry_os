; DESCRIPTION: Composite: . Then Renders a orange box of size 114x64 starting at (72, 24). Then Places a green dot at position (134, 71).
; PLAN: r0=72(x), r1=24(y), r2=114(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=134(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange box of size 114x64 starting at (72, 24).
; PLAN: r0=72(x), r1=24(y), r2=114(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 24
LDI r2, 114
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (134, 71).
; PLAN: r0=134(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 71
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT

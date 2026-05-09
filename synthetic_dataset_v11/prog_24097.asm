; DESCRIPTION: Composite: . Then Renders a cyan box of size 69x69 starting at (14, 28). Then Places a yellow dot at position (63, 174).
; PLAN: r0=14(x), r1=28(y), r2=69(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=63(x), r1=174(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 69x69 starting at (14, 28).
; PLAN: r0=14(x), r1=28(y), r2=69(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 28
LDI r2, 69
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (63, 174).
; PLAN: r0=63(x), r1=174(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 174
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT

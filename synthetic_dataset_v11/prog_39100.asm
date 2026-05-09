; DESCRIPTION: Composite: . Then Places a purple dot at position (63, 29). Then Renders a orange box of size 98x111 starting at (84, 55).
; PLAN: r0=63(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=84(x), r1=55(y), r2=98(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (63, 29).
; PLAN: r0=63(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 29
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 98x111 starting at (84, 55).
; PLAN: r0=84(x), r1=55(y), r2=98(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 55
LDI r2, 98
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

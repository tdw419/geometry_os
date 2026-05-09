; DESCRIPTION: Composite: . Then Renders a green box of size 67x82 starting at (122, 28). Then Places a red dot at position (241, 155).
; PLAN: r0=122(x), r1=28(y), r2=67(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=241(x), r1=155(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 67x82 starting at (122, 28).
; PLAN: r0=122(x), r1=28(y), r2=67(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 28
LDI r2, 67
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (241, 155).
; PLAN: r0=241(x), r1=155(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 155
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT

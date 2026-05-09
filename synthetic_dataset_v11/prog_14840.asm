; DESCRIPTION: Composite: . Then Places a red dot at position (209, 198). Then Renders a white box of size 70x110 starting at (128, 69).
; PLAN: r0=209(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=69(y), r2=70(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (209, 198).
; PLAN: r0=209(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 70x110 starting at (128, 69).
; PLAN: r0=128(x), r1=69(y), r2=70(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 69
LDI r2, 70
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

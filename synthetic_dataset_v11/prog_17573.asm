; DESCRIPTION: Composite: . Then Places a yellow dot at position (239, 76). Then Renders a white box of size 84x70 starting at (87, 116).
; PLAN: r0=239(x), r1=76(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=116(y), r2=84(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (239, 76).
; PLAN: r0=239(x), r1=76(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 76
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 84x70 starting at (87, 116).
; PLAN: r0=87(x), r1=116(y), r2=84(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 116
LDI r2, 84
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

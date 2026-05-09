; DESCRIPTION: Composite: . Then Places a blue 72x62 rectangle at position (161, 28). Then Places a white dot at position (151, 33).
; PLAN: r0=161(x), r1=28(y), r2=72(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 72x62 rectangle at position (161, 28).
; PLAN: r0=161(x), r1=28(y), r2=72(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 28
LDI r2, 72
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (151, 33).
; PLAN: r0=151(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT

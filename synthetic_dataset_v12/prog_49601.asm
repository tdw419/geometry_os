; DESCRIPTION: Places a red 90x91 rectangle at position (64, 43).
; PLAN: r0=64(x), r1=43(y), r2=90(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 43
LDI r2, 90
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

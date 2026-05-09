; DESCRIPTION: Places a green 59x77 rectangle at position (310, 135).
; PLAN: r0=310(x), r1=135(y), r2=59(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 135
LDI r2, 59
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

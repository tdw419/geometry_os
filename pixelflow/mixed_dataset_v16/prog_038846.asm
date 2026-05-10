; DESCRIPTION: Places a yellow 59x11 rectangle at position (283, 125).
; PLAN: r0=283(x), r1=125(y), r2=59(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 125
LDI r2, 59
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

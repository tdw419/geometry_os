; DESCRIPTION: Places a orange 61x91 rectangle at position (7, 125).
; PLAN: r0=7(x), r1=125(y), r2=61(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 125
LDI r2, 61
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

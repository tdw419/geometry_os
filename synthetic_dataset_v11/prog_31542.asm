; DESCRIPTION: Places a white 106x91 rectangle at position (59, 13).
; PLAN: r0=59(x), r1=13(y), r2=106(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 13
LDI r2, 106
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

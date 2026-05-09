; DESCRIPTION: Places a white 51x59 rectangle at position (68, 14).
; PLAN: r0=68(x), r1=14(y), r2=51(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 14
LDI r2, 51
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

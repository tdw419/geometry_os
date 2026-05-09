; DESCRIPTION: Places a white 102x59 rectangle at position (96, 83).
; PLAN: r0=96(x), r1=83(y), r2=102(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 83
LDI r2, 102
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

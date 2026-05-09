; DESCRIPTION: Places a white 33x59 rectangle at position (1, 167).
; PLAN: r0=1(x), r1=167(y), r2=33(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 167
LDI r2, 33
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

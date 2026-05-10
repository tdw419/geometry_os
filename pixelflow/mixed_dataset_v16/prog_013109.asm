; DESCRIPTION: Places a red 36x100 rectangle at position (225, 59).
; PLAN: r0=225(x), r1=59(y), r2=36(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 59
LDI r2, 36
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

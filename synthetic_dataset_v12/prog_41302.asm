; DESCRIPTION: Places a green 69x59 rectangle at position (233, 50).
; PLAN: r0=233(x), r1=50(y), r2=69(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 50
LDI r2, 69
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

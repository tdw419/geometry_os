; DESCRIPTION: Places a green 58x47 rectangle at position (59, 120).
; PLAN: r0=59(x), r1=120(y), r2=58(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 120
LDI r2, 58
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red 54x59 rectangle at position (193, 13).
; PLAN: r0=193(x), r1=13(y), r2=54(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 13
LDI r2, 54
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

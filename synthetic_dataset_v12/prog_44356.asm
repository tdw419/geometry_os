; DESCRIPTION: Places a red 33x66 rectangle at position (308, 59).
; PLAN: r0=308(x), r1=59(y), r2=33(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 59
LDI r2, 33
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

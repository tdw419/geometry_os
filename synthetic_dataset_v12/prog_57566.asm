; DESCRIPTION: Places a red 33x80 rectangle at position (212, 16).
; PLAN: r0=212(x), r1=16(y), r2=33(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 16
LDI r2, 33
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

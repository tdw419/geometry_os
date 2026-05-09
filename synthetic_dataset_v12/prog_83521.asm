; DESCRIPTION: Places a yellow 54x43 rectangle at position (305, 3).
; PLAN: r0=305(x), r1=3(y), r2=54(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 3
LDI r2, 54
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

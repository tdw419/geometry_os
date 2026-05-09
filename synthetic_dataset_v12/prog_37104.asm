; DESCRIPTION: Places a yellow 86x65 rectangle at position (1, 38).
; PLAN: r0=1(x), r1=38(y), r2=86(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 38
LDI r2, 86
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

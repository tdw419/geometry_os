; DESCRIPTION: Places a yellow 105x110 rectangle at position (305, 83).
; PLAN: r0=305(x), r1=83(y), r2=105(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 83
LDI r2, 105
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

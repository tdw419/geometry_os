; DESCRIPTION: Places a green 99x78 rectangle at position (398, 139).
; PLAN: r0=398(x), r1=139(y), r2=99(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 139
LDI r2, 99
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

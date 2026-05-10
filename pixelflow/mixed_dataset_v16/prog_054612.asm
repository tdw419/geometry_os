; DESCRIPTION: Places a green 38x64 rectangle at position (83, 139).
; PLAN: r0=83(x), r1=139(y), r2=38(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 139
LDI r2, 38
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

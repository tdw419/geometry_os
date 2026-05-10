; DESCRIPTION: Places a cyan 13x110 rectangle at position (403, 65).
; PLAN: r0=403(x), r1=65(y), r2=13(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 65
LDI r2, 13
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

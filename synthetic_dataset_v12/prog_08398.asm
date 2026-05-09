; DESCRIPTION: Places a green 45x45 rectangle at position (398, 130).
; PLAN: r0=398(x), r1=130(y), r2=45(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 130
LDI r2, 45
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

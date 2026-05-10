; DESCRIPTION: Places a cyan 40x45 rectangle at position (244, 24).
; PLAN: r0=244(x), r1=24(y), r2=40(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 24
LDI r2, 40
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

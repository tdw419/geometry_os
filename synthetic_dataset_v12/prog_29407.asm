; DESCRIPTION: Places a cyan 76x40 rectangle at position (418, 192).
; PLAN: r0=418(x), r1=192(y), r2=76(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 192
LDI r2, 76
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

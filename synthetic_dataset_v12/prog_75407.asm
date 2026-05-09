; DESCRIPTION: Places a cyan 91x32 rectangle at position (370, 140).
; PLAN: r0=370(x), r1=140(y), r2=91(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 140
LDI r2, 91
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

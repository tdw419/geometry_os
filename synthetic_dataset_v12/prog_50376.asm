; DESCRIPTION: Places a cyan 91x94 rectangle at position (420, 48).
; PLAN: r0=420(x), r1=48(y), r2=91(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 48
LDI r2, 91
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

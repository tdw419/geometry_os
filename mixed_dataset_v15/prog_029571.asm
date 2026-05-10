; DESCRIPTION: Places a cyan 91x33 rectangle at position (247, 20).
; PLAN: r0=247(x), r1=20(y), r2=91(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 20
LDI r2, 91
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

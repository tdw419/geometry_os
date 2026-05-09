; DESCRIPTION: Places a cyan 102x49 rectangle at position (1, 65).
; PLAN: r0=1(x), r1=65(y), r2=102(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 65
LDI r2, 102
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

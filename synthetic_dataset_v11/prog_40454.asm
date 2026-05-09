; DESCRIPTION: Places a cyan 23x40 rectangle at position (217, 102).
; PLAN: r0=217(x), r1=102(y), r2=23(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 102
LDI r2, 23
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

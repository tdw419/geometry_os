; DESCRIPTION: Places a cyan 99x108 rectangle at position (20, 71).
; PLAN: r0=20(x), r1=71(y), r2=99(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 71
LDI r2, 99
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan box of size 37x62 starting at (108, 94).
; PLAN: r0=108(x), r1=94(y), r2=37(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 94
LDI r2, 37
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

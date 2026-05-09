; DESCRIPTION: Renders a cyan box of size 108x62 starting at (281, 20).
; PLAN: r0=281(x), r1=20(y), r2=108(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 20
LDI r2, 108
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
